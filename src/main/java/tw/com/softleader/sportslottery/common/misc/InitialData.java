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
	
	private static final Integer GAME_ROWS_NUM = 1000;
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
    
	private void createGames(Integer num) {
		List<String> leagueNames = teamService.leagueNames();
		
		for (Integer i = 0; i < num; i ++) {
			Integer leagueIndex = rand.nextInt(leagueNames.size());
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
			String ballType = teamAway.getBallType();
			Boolean isEnd = null;
			Long gameScoreAway = 0L;
			Long gameScoreHome = 0L;
			Long gameStatus = 0L;
			if (gameTime.isAfter(LocalDateTime.now().plusHours(-3))) {
				isEnd = false;
			} else {
				isEnd = true;
				switch (ballType) {
					case "Baseball":
						gameScoreAway = Long.valueOf(rand.nextInt(10));
						gameScoreHome = Long.valueOf(rand.nextInt(10));
						break;
					case "Basketball":
						gameScoreAway = Long.valueOf(rand.nextInt(60) + 60);
						gameScoreHome = Long.valueOf(rand.nextInt(60) + 60);
						break;
					case "Soccer":
						gameScoreAway = Long.valueOf(rand.nextInt(5));
						gameScoreHome = Long.valueOf(rand.nextInt(5));
						break;
				}
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
			gameService.insert(game);
			game = gameService.getById(game.getId());
			System.out.println(game);
			System.out.println("createOdds: " + createOdds(game));
			game = gameService.getById(game.getId());
			System.out.println(game);
			System.out.println("setCount: " + setCount(game));
			game = gameService.getById(game.getId());
			System.out.println(game);
			System.out.println("setPassedTypes: " + setPassedTypes(game));
		}
	}
	
	private List<TeamEntity> getTeams(String leagueName) {
		List<TeamEntity> teams = new ArrayList<TeamEntity>();
		List<TeamEntity> teamList = teamService.getTeamsByLeagueName(leagueName);
		System.out.println("teamList: " + teamList.size());
		Integer teamAwayIndex = rand.nextInt(teamList.size());
		Integer teamHomeIndex = null;
		while (true) {
			teamHomeIndex = rand.nextInt(teamList.size());
			if (teamHomeIndex != teamAwayIndex) break;
		}
		
		TeamEntity teamAway = teamList.get(teamAwayIndex);
		teams.add(teamAway);
		TeamEntity teamHome = teamList.get(teamHomeIndex);
		teams.add(teamHome);
		
		return teams;
	}
	
	private Boolean createOdds(GameEntity game) {
		Long gameId = game.getId();
		String ballType = game.getBallType();
		
		List<BigDecimal> atsCombinations = new ArrayList<BigDecimal>();
		BigDecimal scCombination = null;
		Integer atsRnd = null;
		Integer scRnd = null;
		
		switch (ballType) {
			case "Baseball":
				atsRnd = 1;
				scRnd = rand.nextInt(3) + 6;
				atsCombinations.add(new BigDecimal(atsRnd.toString() + ".5"));
				atsCombinations.add(new BigDecimal("-" + atsRnd.toString() + ".5"));
				scCombination = new BigDecimal(scRnd.toString() + ".5");
				break;
			case "Basketball":
				atsRnd = rand.nextInt(20) + 6;
				scRnd = rand.nextInt(70) + 110;
				atsCombinations.add(new BigDecimal(atsRnd.toString() + ".5"));
				atsCombinations.add(new BigDecimal("-" + atsRnd.toString() + ".5"));
				scCombination = new BigDecimal(scRnd.toString() + ".5");
				break;
			case "Soccer":
				atsRnd = 1;
				scRnd = rand.nextInt(4) + 3;
				atsCombinations.add(new BigDecimal(atsRnd.toString() + ".5"));
				atsCombinations.add(new BigDecimal("-" + atsRnd.toString() + ".5"));
				scCombination = new BigDecimal(scRnd.toString() + ".5");
				break;
		}
		String[] oddType = {"SU_A", "SU_H", "ATS_A", "ATS_H", "SC_H", "SC_L", "EVEN", "ODD"};
		for (Integer i = 0; i < oddType.length; i++) {
			OddsEntity odds = new OddsEntity();
			BigDecimal stdValue = new BigDecimal("1.5");
			BigDecimal diffValue = new BigDecimal("0.05");
			BigDecimal range = new BigDecimal(rand.nextInt(21));
			BigDecimal oddValue = diffValue.multiply(range).add(stdValue);
			odds.setGameId(gameId);
			odds.setCount(0L);
			odds.setOddType(oddType[i]);
			odds.setOddValue(oddValue);
			
			System.out.println(ballType);
			System.out.println(atsCombinations);
			Integer atsAIndex = rand.nextInt(2);
			Integer atsHIndex = null;
			while (true) {
				atsHIndex = rand.nextInt(2);
				if (atsAIndex != atsHIndex) break;
			}
			
			switch(oddType[i]) {
				case "ATS_A": 
					odds.setOddCombination(atsCombinations.get(atsAIndex));
					break;
				case "ATS_H": 
					odds.setOddCombination(atsCombinations.get(atsHIndex));
					break;
				case "SC_L": 
					odds.setOddCombination(scCombination);
					break;
				case "SC_H": 
					odds.setOddCombination(scCombination);
					break;
				default: 
					odds.setOddCombination(new BigDecimal("0"));
					break;
			}
			try {
				oddsService.insert(odds);
			} catch (Exception e) {
				e.printStackTrace();
				return false;
			}
		}
		return true;
	}
	
	private Boolean setPassedTypes(GameEntity game) {
		Long gameId = game.getId();
		BigDecimal combination = null;
		String su = null;
		String ats = null;
		String sc = null;
		String eo = null;
		Long gameScoreAway = game.getGameScoreAway();
		Long gameScoreHome = game.getGameScoreHome();
		
		su = gameScoreAway > gameScoreHome? "SU_A":null;
		if (su == null) su = gameScoreAway < gameScoreHome? "SU_H":null;
		combination = oddsService.getByGameIdWithOddType(gameId, "ATS_A").get(0).getOddCombination();
		ats = gameScoreAway + combination.doubleValue() > gameScoreHome? "ATS_A":"ATS_H";
		combination = oddsService.getByGameIdWithOddType(gameId, "SC_H").get(0).getOddCombination();
		sc = gameScoreAway + gameScoreHome > combination.doubleValue()? "SC_H":"SC_L";
		eo = (gameScoreAway + gameScoreHome) % 2 == 0? "EVEN":"ODD";
		
		try {
			oddsService.setIsPass(gameId, su, ats, sc, eo);
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}
	
	private Boolean setCount(GameEntity game) {
		Integer count = null;
		List<OddsEntity> odds = game.getOdds();
		for (OddsEntity odd : odds) {
			count = rand.nextInt(5000) + 1; 
			odd.setCount(new Long(count));
			try {
				oddsService.update(odd);
			} catch (Exception e) {
				e.printStackTrace();
				return false;
			}
			
		}
		return true;
	}
}
