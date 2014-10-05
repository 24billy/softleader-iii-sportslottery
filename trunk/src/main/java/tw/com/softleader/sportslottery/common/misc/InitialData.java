package tw.com.softleader.sportslottery.common.misc;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Random;
import java.util.Set;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import org.joda.time.LocalDate;
import org.joda.time.LocalDateTime;
import org.joda.time.LocalTime;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.context.support.SpringBeanAutowiringSupport;

import tw.com.softleader.sportslottery.setting.entity.GameEntity;
import tw.com.softleader.sportslottery.setting.entity.LotteryEntity;
import tw.com.softleader.sportslottery.setting.entity.LotteryOddsEntity;
import tw.com.softleader.sportslottery.setting.entity.OddsEntity;
import tw.com.softleader.sportslottery.setting.entity.TeamEntity;
import tw.com.softleader.sportslottery.setting.entity.UserEntity;
import tw.com.softleader.sportslottery.setting.service.GameService;
import tw.com.softleader.sportslottery.setting.service.LotteryOddsService;
import tw.com.softleader.sportslottery.setting.service.LotteryService;
import tw.com.softleader.sportslottery.setting.service.OddsService;
import tw.com.softleader.sportslottery.setting.service.TeamService;
import tw.com.softleader.sportslottery.setting.service.UserService;

public class InitialData implements ServletContextListener {
	//private static final String START_DATE = "2014-08-01";
	//private static final String END_DATE = "2014-10-31";
	private static final Integer MAX_GAME_NUM_OF_A_DAY = 20;
	private static final Integer PAST_MONTHS_OF_BEGIN = 3;
	private static final Integer MAX_LOTTERY_NUM_OF_A_DAY = 200;
	@Autowired
	private GameService gameService;
	@Autowired
	private OddsService oddsService;
	@Autowired
	private TeamService teamService;
	@Autowired
	private LotteryService lotteryService;
	@Autowired
	private UserService userService;
	@Autowired
	private LotteryOddsService lotteryOddsService;
	
	private Random rand = new Random();
	
	public void contextInitialized(ServletContextEvent arg0)  {
		SpringBeanAutowiringSupport.processInjectionBasedOnCurrentContext(this);
		//DateTimeFormatter formatter = DateTimeFormat.forPattern("yyyy-MM-dd");
		//LocalDateTime startDate = LocalDate.parse(START_DATE, formatter).toLocalDateTime(new LocalTime(0,0));
		//LocalDateTime endDate = LocalDate.parse(END_DATE, formatter).toLocalDateTime(new LocalTime(0,0));
		LocalDateTime beginDate = LocalDate.now().minusMonths(PAST_MONTHS_OF_BEGIN).plusDays(3).toLocalDateTime(new LocalTime(0, 0));
		System.out.println("BEGIN_DATE: " + beginDate);
		LocalDateTime endDate = LocalDate.now().plusDays(3).toLocalDateTime(new LocalTime(0, 0));
		System.out.println("END_DATE: " + endDate);
		Integer diffDay = 0;
		while (!beginDate.plusDays(diffDay).equals(endDate)) {
			createGames(beginDate.plusDays(diffDay));
			diffDay ++;
		}
		
		diffDay = 0;
		while (!beginDate.plusDays(diffDay).equals(endDate)) {
			createLotterys(beginDate.plusDays(diffDay));
			diffDay ++;
		}
		countLotterys();
		lotteryOddsService.countAllOddsOfGame();
		lotteryService.paidWinsToUser();
    }
	
	private void createGames(LocalDateTime currentDate) {
		List<String> leagueNames = teamService.leagueNames();
		Integer num = rand.nextInt(MAX_GAME_NUM_OF_A_DAY + 1);
		for (Integer i = 0; i < num; i ++) {
			Integer leagueIndex = rand.nextInt(leagueNames.size());
			List<TeamEntity> teams = getTeams(leagueNames.get(leagueIndex));
			
			LocalDateTime gameTime = null;
			gameTime = currentDate
						.plusHours(rand.nextInt(24))
						.plusMinutes(rand.nextInt(2) * 30 + rand.nextInt(2) * 5);
			
			TeamEntity teamAway = teams.get(0);
			TeamEntity teamHome = teams.get(1);
			Long gameNum = gameService.maxGameNum();
			gameNum = gameNum != null? gameNum + 1L:101L;
			String ballType = teamAway.getBallType();
			Boolean isEnd = null;
			Long gameScoreAway = 0L;
			Long gameScoreHome = 0L;
			Long gameStatus = 0L;
			if (gameTime.isAfter(LocalDateTime.now().minusHours(3))) {
				isEnd = false;
			} else {
				isEnd = true;
				switch (ballType) {
					case "Baseball":
						gameScoreAway = Long.valueOf(rand.nextInt(13));
						gameScoreHome = Long.valueOf(rand.nextInt(13));
						break;
					case "Basketball":
						gameScoreAway = Long.valueOf(rand.nextInt(61) + 60);
						gameScoreHome = Long.valueOf(rand.nextInt(61) + 60);
						break;
					case "Soccer":
						gameScoreAway = Long.valueOf(rand.nextInt(7));
						gameScoreHome = Long.valueOf(rand.nextInt(7));
						break;
				}
			}
			if (gameTime.isBefore(LocalDateTime.now().minusDays(1))) {
				gameStatus = 3L;
			} else if (gameTime.isBefore(LocalDateTime.now().minusHours(3))) {
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
			createOdds(game);
			//game = gameService.getById(game.getId());
			//setCount(game);
			game = gameService.getById(game.getId());
			setPassedTypes(game);
		}
	}
	
	private List<TeamEntity> getTeams(String leagueName) {
		List<TeamEntity> teams = new ArrayList<TeamEntity>();
		List<TeamEntity> teamList = teamService.getTeamsByLeagueName(leagueName);
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
				scRnd = rand.nextInt(4) + 6;
				atsCombinations.add(new BigDecimal(atsRnd.toString() + ".5"));
				atsCombinations.add(new BigDecimal("-" + atsRnd.toString() + ".5"));
				scCombination = new BigDecimal(scRnd.toString() + ".5");
				break;
			case "Basketball":
				atsRnd = rand.nextInt(20) + 6;
				scRnd = rand.nextInt(70) + 120;
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
			BigDecimal stdValue = new BigDecimal("1.1");
			BigDecimal diffValue = new BigDecimal("0.05");
			BigDecimal range = new BigDecimal(rand.nextInt(31));
			BigDecimal oddValue = diffValue.multiply(range).add(stdValue);
			odds.setGameId(gameId);
			odds.setCount(0L);
			odds.setOddType(oddType[i]);
			odds.setOddValue(oddValue);
			
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
		if (!game.getIsEnd()) {
			return true;
		}
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
	/*
	private Boolean setCount(GameEntity game) {
		Integer count = null;
		List<OddsEntity> odds = game.getOdds();
		try {
			for (OddsEntity odd : odds) {
				count = rand.nextInt(5000) + 1; 
				odd.setCount(new Long(count));
				oddsService.update(odd);
			}
		} catch (Exception e) {
			return false;
		}
		return true;
	}
	*/
	private Boolean createLotterys(LocalDateTime currentDate) {
		List<UserEntity> users = userService.getAll();
		List<GameEntity> games = gameService.getByNearDays(currentDate);
		List<LotteryEntity> lotterys = new ArrayList<LotteryEntity>();
		Integer lotteryNum = rand.nextInt(MAX_LOTTERY_NUM_OF_A_DAY);
		Integer gamesSize = games != null? games.size():null;
		Integer usersSize = users.size();
		try {
			if (gamesSize != null && gamesSize > 0) {
				for (Integer num = 0; num < lotteryNum; num ++) {
					LotteryEntity lottery = new LotteryEntity();
					Long userId = new Long(rand.nextInt(usersSize) + 1);
					lottery.setUserId(userId);
					lottery.setLotteryStatus(0L);
					lottery.setWin(-1L);
					lottery = lotteryService.insert(lottery);
					lotterys.add(lottery);
				}
				for (LotteryEntity lottery : lotterys) {
					LotteryOddsEntity lotteryOdds = null;
					Set<LotteryOddsEntity> lotteryOddsList = new HashSet<LotteryOddsEntity>();
					Integer lotteryOddsListSize = lotteryOddsList.size();
					Long capital = 0L;
					for (Integer num = 0; num < gamesSize; num ++) {
						lotteryOdds = new LotteryOddsEntity();
						List<OddsEntity> odds = games.get(num).getOdds();
						Integer oddsSize = odds.size();
						LocalDateTime confirmTime = currentDate
														.minusHours(rand.nextInt(48))
														.minusMinutes(rand.nextInt(60))
														.minusSeconds(rand.nextInt(60));
						lottery.setConfirmTime(confirmTime);
						OddsEntity odd = odds.get(rand.nextInt(oddsSize));
						if (rand.nextInt(11) > 9) { //10%機率買lottery
							lotteryOdds.setLotteryId(lottery.getId());
							lotteryOdds.setOddsId(odd);
							lotteryOdds = lotteryOddsService.insert(lotteryOdds);
							lotteryOddsList.add(lotteryOdds);
							lotteryOddsListSize = lotteryOddsList.size();
							if (lotteryOddsListSize == 8) {
								break;
							}
						}
						if (num == gamesSize - 1 && lotteryOddsListSize == 0) {
							lotteryOdds.setLotteryId(lottery.getId());
							lotteryOdds.setOddsId(odd);
							lotteryOdds = lotteryOddsService.insert(lotteryOdds);
							lotteryOddsList.add(lotteryOdds);
							lotteryOddsListSize = lotteryOddsList.size();
						}
					}
					if (lotteryOddsListSize == 1) { //投注數1，只買單場
						capital = new Long(100 * (rand.nextInt(10) + 1));
						lottery.setCom1(1L);
					} else if (rand.nextInt(11) >= 2) { //80%機率買過關
						capital = new Long(100 * (rand.nextInt(10) + 1));
						lottery.setCom0(1L);
					} else { //過關組合
						capital = new Long(100 * (rand.nextInt(10) + 1));
						Set<Integer> coms = new HashSet<Integer>();
						Integer comNum = rand.nextInt(lotteryOddsListSize) + 1; //選取多少過關組合
						while (coms.size() != comNum) { //隨機選取過關組合直到comNum
							Integer index = rand.nextInt(8) + 1;
							if (index <= lotteryOddsListSize) {
								coms.add(index);
							}
						}
						Long count = 0L;
						for (Integer com : coms) { //選定過關組合併計算組合數
							switch (com) {
								case 1: 
									lottery.setCom1(1L);
									count += lotteryOddsListSize;
									break;
								case 2: 
									lottery.setCom2(1L);
									count += lotteryOddsListSize * (lotteryOddsListSize - 1) / 2;
									break;
								case 3: 
									lottery.setCom3(1L);
									count += lotteryOddsListSize * (lotteryOddsListSize - 1) * (lotteryOddsListSize - 2) / 6;
									break;
								case 4: 
									lottery.setCom4(1L);
									count += lotteryOddsListSize * (lotteryOddsListSize - 1) * (lotteryOddsListSize - 2) * (lotteryOddsListSize - 3) / 24;
									break;
								case 5: 
									lottery.setCom5(1L);
									count += lotteryOddsListSize * (lotteryOddsListSize - 1) * (lotteryOddsListSize - 2) * (lotteryOddsListSize - 3)
												* (lotteryOddsListSize - 4) / 120;
									break;
								case 6: 
									lottery.setCom6(1L);
									count += lotteryOddsListSize * (lotteryOddsListSize - 1) * (lotteryOddsListSize - 2) * (lotteryOddsListSize - 3)
												* (lotteryOddsListSize - 4) * (lotteryOddsListSize - 5) / 720;
									break;
								case 7: 
									lottery.setCom7(1L);
									count += lotteryOddsListSize * (lotteryOddsListSize - 1) * (lotteryOddsListSize - 2) * (lotteryOddsListSize - 3)
												* (lotteryOddsListSize - 4) * (lotteryOddsListSize - 5) * (lotteryOddsListSize - 6) / 5040;
									break;
								case 8: 
									lottery.setCom8(1L);
									count += 1;
									break;
							}
						}
						capital = capital * count;
						
					}
					lottery.setCapital(capital);
					lotteryService.update(lottery);
					//UserEntity user = userService.getById(lottery.getUserId());
					//user.setCoins(user.getCoins() - capital);
					//userService.update(user);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}
	/*
	private LotteryEntity setComs(LotteryEntity lottery, Set<Integer> coms) {
		for (Integer com : coms) {
			switch (com) {
				case 1: 
					lottery.setCom1(1L);
					break;
				case 2: 
					lottery.setCom2(1L);
					break;
				case 3: 
					lottery.setCom3(1L); 
					break;
				case 4: 
					lottery.setCom4(1L);
					break;
				case 5: 
					lottery.setCom5(1L);
					break;
				case 6: 
					lottery.setCom6(1L);
					break;
				case 7: 
					lottery.setCom7(1L);
					break;
				case 8: 
					lottery.setCom8(1L);
					break;
			}
		}
		return lottery;
	}
	*/
	private Boolean countLotterys() {
		List<LotteryEntity> lotterys = lotteryService.getAll();
		try {
			for (LotteryEntity lottery : lotterys) {
				lotteryService.calculatePrize(lottery);
			}
		} catch (Exception e) {
			return false;
		}
		return true;
	}
	
	public void contextDestroyed(ServletContextEvent arg0) {
	}
}
