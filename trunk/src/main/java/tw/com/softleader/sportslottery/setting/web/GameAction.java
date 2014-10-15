package tw.com.softleader.sportslottery.setting.web;

import java.io.ByteArrayInputStream;
import java.io.InputStream;
import java.math.BigDecimal;
import java.nio.charset.StandardCharsets;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.ServletContext;

import org.apache.commons.lang3.StringUtils;
import org.apache.struts2.ServletActionContext;
import org.joda.time.LocalDate;
import org.joda.time.LocalDateTime;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import tw.com.softleader.sportslottery.setting.entity.GameEntity;
import tw.com.softleader.sportslottery.setting.entity.LotteryEntity;
import tw.com.softleader.sportslottery.setting.entity.LotteryOddsEntity;
import tw.com.softleader.sportslottery.setting.entity.OddsEntity;
import tw.com.softleader.sportslottery.setting.entity.TeamEntity;
import tw.com.softleader.sportslottery.setting.service.GameService;
import tw.com.softleader.sportslottery.setting.service.LotteryOddsService;
import tw.com.softleader.sportslottery.setting.service.LotteryService;
import tw.com.softleader.sportslottery.setting.service.OddsService;
import tw.com.softleader.sportslottery.setting.service.TeamService;
import tw.com.softleader.sportslottery.setting.util.CountBean;

import com.google.gson.Gson;
import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class GameAction extends ActionSupport {
 
	private static final long serialVersionUID = 2014L;
	
	@Autowired
	private GameService service;
	@Autowired
	private TeamService teamService;
	@Autowired
	private OddsService oddsService;
	@Autowired
	private LotteryOddsService lotteryOddsService;
	@Autowired
	private LotteryService lotteryService;
	
	private Long maxGameNum;
	private List<String> ballTypes;
	
	private GameEntity model;
	private List<GameEntity> models;
	private Logger log = LoggerFactory.getLogger(GameAction.class);
	private Long teamAwayId;
	private Long teamHomeId;
	private InputStream inputStream;
	private String json;
	private String catagory;
	private String gameStatus;
	private LocalDate timeFrom, timeTo;
	private String teamName;
	
	private Long complexGameNum;
	private String complexTeamName;
	private Boolean complexIsEnd;
	private LocalDate complexTimeBegin;
	private LocalDate complexTimeEnd;
	private String complexBallType;
	private String complexLeagueName;
	
	private Long linkGameNum;
	private String linkTeamSearch;
	private List<Map<String, CountBean>> listMap;
	private String linkGameTime;
	
	private Locale locale = ActionContext.getContext().getLocale();
	
	public String getGameStatus() {
		return gameStatus;
	}

	public void setGameStatus(String gameStatus) {
		this.gameStatus = gameStatus;
	}

	public Locale getLocale() {
		return locale;
	}

	public String getLinkGameTime() {
		return linkGameTime;
	}

	public void setLinkGameTime(String linkGameTime) {
		this.linkGameTime = linkGameTime;
	}

	public List<String> getBallTypes() {
		return ballTypes;
	}
	
	public Long getMaxGameNum() {
		return maxGameNum;
	}

	public List<Map<String, CountBean>> getListMap() {
		return listMap;
	}

	public void setListMap(List<Map<String, CountBean>> listMap) {
		this.listMap = listMap;
	}

	public String getComplexLeagueName() {
		return complexLeagueName;
	}

	public void setComplexLeagueName(String complexLeagueName) {
		this.complexLeagueName = complexLeagueName;
	}

	public LocalDate getComplexTimeBegin() {
		return complexTimeBegin;
	}

	public void setComplexTimeBegin(LocalDate complexTimeBegin) {
		this.complexTimeBegin = complexTimeBegin;
	}

	public LocalDate getComplexTimeEnd() {
		return complexTimeEnd;
	}

	public void setComplexTimeEnd(LocalDate complexTimeEnd) {
		this.complexTimeEnd = complexTimeEnd;
	}

	public String getComplexBallType() {
		return complexBallType;
	}

	public void setComplexBallType(String complexBallType) {
		this.complexBallType = complexBallType;
	}

	public Long getComplexGameNum() {
		return complexGameNum;
	}

	public void setComplexGameNum(Long complexGameNum) {
		this.complexGameNum = complexGameNum;
	}

	public String getComplexTeamName() {
		return complexTeamName;
	}

	public void setComplexTeamName(String complexTeamName) {
		this.complexTeamName = complexTeamName;
	}

	public Boolean getComplexIsEnd() {
		return complexIsEnd;
	}

	public void setComplexIsEnd(Boolean complexIsEnd) {
		this.complexIsEnd = complexIsEnd;
	}

	public String getJson() {
		return json;
	}
	
	public GameEntity getModel() {
		return model;
	}
	
	public void setModel(GameEntity model) {
		this.model = model;
	}
	
	public List<GameEntity> getModels() {
		return models;
	}
	
	public void setTeamAwayId(Long teamAwayId) {
		this.teamAwayId = teamAwayId;
	}
	
	public void setTeamHomeId(Long teamHomeId) {
		this.teamHomeId = teamHomeId;
	}
	
	public InputStream getInputStream() {
		return inputStream;
	}
	
	public String getCatagory() {
		return catagory;
	}

	public void setCatagory(String catagory) {
		this.catagory = catagory;
	}


	public LocalDate getTimeFrom() {
		return timeFrom;
	}

	public void setTimeFrom(LocalDate timeFrom) {
		this.timeFrom = timeFrom;
	}

	public LocalDate getTimeTo() {
		return timeTo;
	}

	public void setTimeTo(LocalDate timeTo) {
		this.timeTo = timeTo;
	}

	public void setTeamName(String teamName) {
		this.teamName = teamName;
	}

	public String execute(){
		log.debug("execute...");
		
		return SUCCESS;
	}
	
	public String select() {
		log.debug("GameAction select()");
		Long gameId = model != null? model.getId():null;
		if (gameId != null && gameId > 0) {
			json = new Gson().toJson(service.getById(gameId));
		} else {
			json = new Gson().toJson(service.getComplex(null, null, null, null, null, null, complexBallType, null));
		}
		
		inputStream = new ByteArrayInputStream(json.getBytes(StandardCharsets.UTF_8));
	
		return "select";
	}
	
	public String selectLatestFiveRecord() {
		log.debug("GameAction selectLatestFiveRecord()");
		json = new Gson().toJson(service.getLatestFiveRecord());
		inputStream = new ByteArrayInputStream(json.getBytes(StandardCharsets.UTF_8));
		return "select";
	}
	
	public String selectNearDays() {
		log.debug("selectNearDays...");
		json = new Gson().toJson(service.getComplex(null, null, null, null, new LocalDate().minusDays(1), new LocalDate().plusDays(3), complexBallType, null));
		
		inputStream = new ByteArrayInputStream(json.getBytes(StandardCharsets.UTF_8));
	
		return "selectNearDays";
	}
	
	public String selectNearNotEnd() {
		log.debug("selectNearDays...");
		json = new Gson().toJson(service.getComplex(null, null, null, null, complexTimeBegin.minusDays(1), complexTimeEnd.plusDays(2), complexBallType, complexLeagueName));
		
		inputStream = new ByteArrayInputStream(json.getBytes(StandardCharsets.UTF_8));
	
		return "selectNearNotEnd";
	}
	
	public String selectNotEnd() {
		log.debug("selectNearDays...");
		json = new Gson().toJson(service.getComplex(null, null, null, null, null, null, complexBallType, null));
		
		inputStream = new ByteArrayInputStream(json.getBytes(StandardCharsets.UTF_8));
	
		return "selectNotEnd";
	}
	
	public String payout() {
		log.debug("GameAction payout()");
		
		String result = null;
		
		try {
			Long gameId = model.getId();
			model = service.getById(gameId);
			List<LotteryEntity> lotterys = lotteryService.getLotterysByGame(model);
			for (LotteryEntity lottery : lotterys) {
				lotteryService.calculatePrize(lottery);
			}
			
			for (OddsEntity odds : model.getOdds()) {
				List<LotteryOddsEntity> los = lotteryOddsService.getByOddsId(odds.getId());
				int count = los.size();
				odds.setCount(new Long(count));
				oddsService.update(odds);
			}
			model.setGameStatus(3L);
			service.update(model);
			result = "success";
		} catch (Exception e) {
			e.printStackTrace();
			result = "failed";
		}
		
		inputStream = new ByteArrayInputStream(result.getBytes(StandardCharsets.UTF_8));
		return "message";
	}
	
	public String payoutToday() {
		log.debug("GameAction payoutToday()");
		
		String result = null;
		
		try {
			models = service.getFinishedGameToday();
			for (GameEntity model : models) {
				List<LotteryEntity> lotterys = lotteryService.getLotterysByGame(model);
				for (LotteryEntity lottery : lotterys) {
					lotteryService.calculatePrize(lottery);
				}
				
				for (OddsEntity odds : model.getOdds()) {
					List<LotteryOddsEntity> los = lotteryOddsService.getByOddsId(odds.getId());
					int count = los.size();
					odds.setCount(new Long(count));
					oddsService.update(odds);
				}
				model.setGameStatus(3L);
				service.update(model);
			}
			result = "success";
		} catch (Exception e) {
			result = "failed";
			e.printStackTrace();
		}
		
		inputStream = new ByteArrayInputStream(result.getBytes(StandardCharsets.UTF_8));
		return "message";
	}
	
	public String update() {
		log.debug("GameAction update()");
		BigDecimal combination = null;
		String result = null;
		String su = null;
		String ats = null;
		String sc = null;
		String eo = null;
		Long gameId = model.getId();
		Long gameScoreAway = model.getGameScoreAway();
		Long gameScoreHome = model.getGameScoreHome();
		Boolean isEnd = model.getIsEnd();
		
		su = gameScoreAway > gameScoreHome? "SU_A":null;
		if (su == null) su = gameScoreAway < gameScoreHome? "SU_H":null;
		combination = oddsService.getByGameIdWithOddType(gameId, "ATS_A").get(0).getOddCombination();
		ats = gameScoreAway - combination.doubleValue() > gameScoreHome? "ATS_A":"ATS_H";
		combination = oddsService.getByGameIdWithOddType(gameId, "SC_H").get(0).getOddCombination();
		sc = gameScoreAway + gameScoreHome > combination.doubleValue()? "SC_H":"SC_L";
		eo = (gameScoreAway + gameScoreHome) % 2 == 0? "EVEN":"ODD";
		
		try {
			oddsService.setIsPass(gameId, su, ats, sc, eo);
			
			GameEntity game = service.getById(gameId);
			game.setIsEnd(isEnd);
			game.setGameScoreAway(gameScoreAway);
			game.setGameScoreHome(gameScoreHome);
			game.setGameStatus(2L);
			service.update(game);
			
			result = "success";
		} catch (Exception e) {
			e.printStackTrace();
			result = "failed";
		}
		
		inputStream = new ByteArrayInputStream(result.getBytes(StandardCharsets.UTF_8));
		return "message";
	}
	
	public String open() {
		log.debug("GameAction start()");
		
		String result = null;
		try {
			model = service.getById(model.getId());
			model.setGameStatus(1L);
			service.update(model);
			
			result = "success";
		} catch (Exception e) {
			e.printStackTrace();
			result = "failed";
		}
		
		inputStream = new ByteArrayInputStream(result.getBytes(StandardCharsets.UTF_8));
		return "message";
	}
	
	public String insert() {
		log.debug("GameAction insert()");
		
		String result = null;
		Long gameId = model.getId();
		String ballType = model.getBallType();
		LocalDateTime gameTime = model.getGameTime();
		TeamEntity teamAway = teamService.getById(teamAwayId);
		TeamEntity teamHome = teamService.getById(teamHomeId);
		
		if (gameId != null && gameId > 0) {
			model = service.getById(gameId);
			model.setBallType(ballType);
			model.setGameTime(gameTime);
			model.setTeamAway(teamAway);
			model.setTeamHome(teamHome);
			
			try {
				service.update(model);
				result = gameId.toString();
			} catch (Exception e) {
				e.printStackTrace();
				result = "failed";
			}
			
		} else {
			model.setTeamAway(teamAway);
			model.setTeamHome(teamHome);
			model.setIsEnd(false);
			model.setGameStatus(0L);
			
			try {
				model = service.insert(model);
				result = model.getId().toString();
			} catch (Exception e) {
				e.printStackTrace();
				result = "failed";
			}
		}
		
		inputStream = new ByteArrayInputStream(result.getBytes(StandardCharsets.UTF_8));
		return "message";
		
	}
	
	public String delete() {
		log.debug("GameAction delete()");
		
		String result = null;
		try {
			model = service.getById(model.getId());
			service.delete(model);
			result = "success";
		} catch (Exception e) {
			e.printStackTrace();
			result = "failed";
		}
		
		inputStream = new ByteArrayInputStream(result.getBytes(StandardCharsets.UTF_8));
		return "message";
	}
	
	public String admin() {
		log.debug("GameAction admin()");
		maxGameNum = service.maxGameNum();
		ballTypes = service.getBallTypes();
		String ballType = catagory != null? catagory:ballTypes.get(0);
		Long gameStatus = 0L;
		if (!StringUtils.isEmpty(this.gameStatus)) { 
			gameStatus = !this.gameStatus.equals("progress")? Long.parseLong(this.gameStatus):null;
		}
		List<GameEntity> games = service.getByBallTypeAndGameStatus(ballType, gameStatus);
		json = new Gson().toJson(games);
		return Action.SUCCESS;
	}
	
	/*public String searchHistoryMethod(){
		log.debug("searchHistoryMethod...");
		json = new Gson().toJson(service.getForHistory(timeFrom, timeTo, teamName));
		inputStream = new ByteArrayInputStream(json.getBytes(StandardCharsets.UTF_8));
		
		return SUCCESS;
	}*/
	
	public String gameHistory() {
		log.debug("gameHistory...");
		return SUCCESS;
	}
	public String navigationPage(){
		log.debug("navigationPage...");
		return SUCCESS;
	}
	
	public String searchHistoryMethod(){
		log.debug("searchHistoryMethod...");
		json = new Gson().toJson(service.getForHistory(timeFrom, timeTo, teamName));
		inputStream = new ByteArrayInputStream(json.getBytes(StandardCharsets.UTF_8));
		
		return "searchHistoryMethod";
	}
	
	public String countInfoGraph(){
		try {
			//System.out.println("linkGameNum............................"+ linkGameNum);
			//System.out.println("linkTeamSearch........................."+ linkTeamSearch);
			Long gameId= service.getGameIdByGameNum(linkGameNum);
			//輸入gamiId 和teamName取得COUNT資訊
			//listMap= service.getCountInfoHistory(linkTeamSearch, gameId);
			listMap=service.getCountInfoHistoryPrevious3month(linkTeamSearch, gameId);
			
			//附加Max CountBean 於將要傳出的list中，要傳出的list已在addMaxBeanToCountHistory方法裡取出
//			listMap = service.addMaxBeanToCountHistory(linkTeamSearch, gameId);
			json = new Gson().toJson(listMap);
//			json = new Gson().toJson(service.trialGetCountInfoHistor());//使用預設值
		} catch (Exception e) {
			json = "error";
			
			e.printStackTrace();
		}
		inputStream = new ByteArrayInputStream(json.getBytes(StandardCharsets.UTF_8));
		return "countInfoGraph";
	}
	
	public String countAllHistoryByTeam(){
		

		json = new Gson().toJson(service.getAllCountHistoryByTeam(linkTeamSearch));//輸入teamName取得COUNT資訊
//		json = new Gson().toJson(service.trialGetCountInfoHistory());//使用預設值
		inputStream = new ByteArrayInputStream(json.getBytes(StandardCharsets.UTF_8));
		
		return "countAllHistoryByTeam";
		
	}
	
	public String countAllHistoryByTime(){
		
//		System.out.println("linkGameTime......."+ linkGameTime);
		
		
		
		this.useLocalDate();//使用LocalDate 為輸入時間
		//this.useLocalDateTime();//使用LocalDateTime 為輸入時間，無法使用因為HIGHCHART取值的問題
		
		inputStream = new ByteArrayInputStream(json.getBytes(StandardCharsets.UTF_8));
		return "countAllHistoryByTime";
		//return "countInfoGraph";
	}
	
	public void useLocalDate(){
		//linkGameTime.......2014年03月26日 21:06(三)
				//想要2014-03-26
		linkGameTime=linkGameTime.substring(0, 4)+"-"+linkGameTime.substring(5,7)+"-"+linkGameTime.substring(8, 10);
		/*		linkGameTime
					.replace("年", "-")
					.replace("月", "-")
					.replace("日", "");*/
		//System.out.println("linkGameTime......."+ linkGameTime);
		LocalDate date1 = LocalDate.parse(linkGameTime);
		//json = new Gson().toJson(service.getAllCountHistoryByTime(date1));//輸入time取得之前的COUNT資訊
		json = new Gson().toJson(service.getAllCountHistoryByTimePrevious3Days(date1));//輸入time取得三天內的COUNT資訊
		//json = new Gson().toJson(service.getAllCountHistoryByTimePrevious3Month(date1));//輸入time取得三月內的COUNT資訊
		
	}
	
	public void useLocalDateTime(){
		//linkGameTime.......2014年03月26日 21:06(三)
				//想要2014-03-26T21:06
		linkGameTime=linkGameTime.substring(0, 4)+"-"+linkGameTime.substring(5,7)+"-"+linkGameTime.substring(8, 10)+"T"+linkGameTime.substring(12, 17);
		System.out.println("linkGameTime......."+ linkGameTime);
		LocalDateTime date1 = LocalDateTime.parse(linkGameTime);
		System.out.println(date1.toString());//2014-09-24T14:08:00.000
		json = new Gson().toJson(service.getGameByLocalDateTime(date1));//輸入time取得之前的COUNT資訊
		System.out.println(json);

	}
	
	public String successCountAllHistoryByTime() {
		return Action.SUCCESS;
	}
	
	public String teamChartOddTime() {
		return Action.SUCCESS;
	}
	
	//回傳count歷史中最大比率的CountBean
	public String MaxCountBean(){
		log.debug("Log listMap :{}",listMap);
		List<CountBean> list = service.getSortCountHistory(listMap);
		CountBean maxBean = list.get(0);//取得最大過關數比的CountBean
		json = new Gson().toJson(maxBean);
		inputStream = new ByteArrayInputStream(json.getBytes(StandardCharsets.UTF_8));
		System.out.println("...........jsfkidaiwerj3jlrujriwejr53 3wrjsdfjfsdlfdksfjk;jasdfkjasfj;lsdjfkjas;fjkasdfj;asdjfkdjsfkdks");
		return "MaxCountBean";
	}
	
	public String gameHistoryComplex() {
		log.debug("gameHistoryComplex...");
		return SUCCESS;
	}
	
	public String searchHistoryComplexData() {
		log.debug("searchHistoryComplexData...");
		
		System.out.println(
				"complexGameNum:" + complexGameNum+
				"complexTeamName:" + complexTeamName+
				"complexIsEnd:" + complexIsEnd+
				"complexTimeBegin:" + complexTimeBegin+
				"complexTimeEnd:" + complexTimeEnd+
				"complexBallType:" + complexBallType
				);
		
		
		if(complexIsEnd != null && complexIsEnd.equals(true)){
			json = new Gson().toJson(service.getComplex(complexGameNum, complexTeamName, 3L, 3L, complexTimeBegin, complexTimeEnd, complexBallType, complexLeagueName));
		} else if(complexIsEnd != null && complexIsEnd.equals(false)){
			json = new Gson().toJson(service.getComplex(complexGameNum, complexTeamName, 0L, 2L, complexTimeBegin, complexTimeEnd, complexBallType, complexLeagueName));
		} else {
			json = new Gson().toJson(service.getComplex(complexGameNum, complexTeamName, null, null, complexTimeBegin, complexTimeEnd, complexBallType, complexLeagueName));
		}
		
		inputStream = new ByteArrayInputStream(json.getBytes(StandardCharsets.UTF_8));

		return "searchHistoryComplexData";
	}

	public Long getLinkGameNum() {
		return linkGameNum;
	}

	public void setLinkGameNum(Long linkGameNum) {
		this.linkGameNum = linkGameNum;
	}

	public String getLinkTeamSearch() {
		return linkTeamSearch;
	}

	public void setLinkTeamSearch(String linkTeamSearch) {
		this.linkTeamSearch = linkTeamSearch;
	}
	
	//取得熱門賽事(由使用者發送請求)
	public String getHotGames(){
		
		log.debug("要求熱門賽事");
		ServletContext servletContext = ServletActionContext.getServletContext();
		List<GameEntity> hotOdds = (List<GameEntity>)servletContext.getAttribute((complexBallType));
		
		json = new Gson().toJson(hotOdds);
		inputStream = new ByteArrayInputStream(json.getBytes(StandardCharsets.UTF_8));
			
	return "getHotGames";
	}
}
