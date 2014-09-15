package tw.com.softleader.sportslottery.common.misc;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import org.joda.time.LocalDateTime;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.context.support.SpringBeanAutowiringSupport;

import tw.com.softleader.sportslottery.setting.entity.GameEntity;
import tw.com.softleader.sportslottery.setting.entity.OddsEntity;
import tw.com.softleader.sportslottery.setting.entity.TeamEntity;
import tw.com.softleader.sportslottery.setting.service.GameService;
import tw.com.softleader.sportslottery.setting.service.OddsService;
import tw.com.softleader.sportslottery.setting.service.TeamService;

public class InitialData implements ServletContextListener {
	
	private static int GAME_ROWS_NUM = 100;
	@Autowired
	private GameService gameService;
	@Autowired
	private OddsService oddsService;
	@Autowired
	private TeamService teamService;
	
	private Random rand = new Random();
	
	public void contextInitialized(ServletContextEvent arg0)  {
		SpringBeanAutowiringSupport.processInjectionBasedOnCurrentContext(this);
		createGames(GAME_ROWS_NUM);
    }
	
    public void contextDestroyed(ServletContextEvent arg0)  { 
    }
    
	private void createGames(int num) {
		List<String> leagueNames = teamService.leagueNames();
		
		for (int i = 0; i < num; i ++) {
			int leagueIndex = rand.nextInt(leagueNames.size() - 1);
			List<TeamEntity> teams = getTeams(leagueNames.get(leagueIndex));
			
			LocalDateTime gameTime = LocalDateTime.now()
										.plusMinutes(rand.nextInt(60) - 30)
										.withSecondOfMinute(0)
										.withMillisOfSecond(0);
			if (i == num - 1) {
				gameTime = gameTime.plusHours(-1);
			} else {
				gameTime = gameTime
							.plusMonths(rand.nextInt(8) - 6)
							.plusDays(rand.nextInt(30) - 15)
							.plusHours(rand.nextInt(24) - 12);
			}
			
			TeamEntity teamAway = teams.get(0);
			TeamEntity teamHome = teams.get(1);
			Long gameNum = gameService.maxGameNum();
			if (gameNum != null) {
				gameNum += 1;
			} else {
				gameNum = 100L;
			}
			String ballType = "Baseball";
			Boolean isEnd = null;
			Long gameScoreAway = 0L;
			Long gameScoreHome = 0L;
			Long gameStatus = 0L;
			if (gameTime.isAfter(LocalDateTime.now().plusHours(-3))) {
				isEnd = false;
			} else {
				isEnd = true;
				gameScoreAway = Long.valueOf(rand.nextInt(10));
				gameScoreHome = Long.valueOf(rand.nextInt(10));
			}
			if (gameTime.isBefore(LocalDateTime.now().plusDays(-1))) {
				gameStatus = 3L;
			} else if (gameTime.isBefore(LocalDateTime.now().plusHours(-3))) {
				gameStatus = 2L;
			} else if (gameTime.isBefore(LocalDateTime.now().plusDays(2))) {
				gameStatus = 1L;
			}
			
			GameEntity game = new GameEntity();
			game.setGameNum(gameNum);
			game.setTeamAway(teamAway);
			game.setTeamHome(teamHome);
			game.setGameScoreAway(gameScoreAway);
			game.setGameScoreHome(gameScoreHome);
			game.setBallType(ballType);
			game.setGameTime(gameTime);
			game.setIsEnd(isEnd);
			game.setGameStatus(gameStatus);
			game = gameService.insert(game);
			createOdds(game, getPassedTypes(game));
		}
	}
	
	private List<TeamEntity> getTeams(String leagueName) {
		List<TeamEntity> teams = new ArrayList<TeamEntity>();
		List<TeamEntity> teamList = teamService.getTeamsByLeagueName(leagueName);
		
		int teamAwayIndex = rand.nextInt(teamList.size() - 1);
		TeamEntity teamAway = teamList.get(teamAwayIndex);
		teams.add(teamAway);
		teamList.remove(teamAwayIndex);
		
		
		int teamHomeIndex = rand.nextInt(teamList.size() - 1);
		TeamEntity teamHome = teamList.get(teamHomeIndex);
		teams.add(teamHome);
		
		return teams;
	}
	
	private void createOdds(GameEntity game, String[] passedTypes) {
		Long gameId = game.getId();
		
		String[] oddType = {"SU_A", "SU_H", "ATS_A", "ATS_H", "SC_H", "SC_L", "EVEN", "ODD"};
		for (int i = 0; i < oddType.length; i++) {
			OddsEntity odds = new OddsEntity();
			BigDecimal stdValue = new BigDecimal("1.5");
			BigDecimal diffValue = new BigDecimal("0.05");
			BigDecimal range = new BigDecimal(rand.nextInt(21));
			BigDecimal oddValue = diffValue.multiply(range).add(stdValue);
			odds.setGameId(gameId);
			odds.setCount(0L);
			odds.setOddType(oddType[i]);
			odds.setOddValue(oddValue);
			
			switch(oddType[i]) {
				case "ATS_A": odds.setOddCombination(new BigDecimal("-1.5")); break;
				case "ATS_H": odds.setOddCombination(new BigDecimal("1.5")); break;
				case "SC_L": odds.setOddCombination(new BigDecimal("7.5")); break;
				case "SC_H": odds.setOddCombination(new BigDecimal("7.5")); break;
				default: odds.setOddCombination(new BigDecimal("0"));
			}
			
			if (game.getIsEnd()) {
				odds.setCount(Long.valueOf(rand.nextInt(1000) + 1));
				for (String passedType : passedTypes) {
					if (passedType != null) {
						if (passedType.equals(oddType[i])) {
							odds.setIsPass(true);
							break;
						} else {
							odds.setIsPass(false);
						}
					}
				}
			}
			oddsService.insert(odds);
		}
	}
	
	private String[] getPassedTypes(GameEntity game) {
		String su = null;
		String ats = null;
		String sc = null;
		String eo = null;
		Long gameScoreAway = game.getGameScoreAway();
		Long gameScoreHome = game.getGameScoreHome();
		
		if (gameScoreAway > gameScoreHome) {
			su = "SU_A";
		} else if (gameScoreAway < gameScoreHome) {
			su = "SU_H";
		
		}
		
		if (gameScoreAway > gameScoreHome + 1.5) {
			ats = "ATS_A";
		} else if (gameScoreAway < gameScoreHome + 1.5) {
			ats = "ATS_H";
		}
		
		if ((gameScoreAway + gameScoreHome) > 7.5) {
			sc = "SC_H";
		} else {
			sc = "SC_L";
		}
		
		if ((gameScoreAway + gameScoreHome) % 2 == 0) {
			eo = "EVEN";
		} else {
			eo = "ODD";
		}
		String[] passedTypes = {su, ats, sc, eo};
		return passedTypes;
	}
}
