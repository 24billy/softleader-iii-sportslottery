package tw.com.softleader.sportslottery.setting.web;

import java.io.ByteArrayInputStream;
import java.io.InputStream;
import java.nio.charset.StandardCharsets;
import java.util.List;

import org.joda.time.LocalDate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.StringUtils;

import tw.com.softleader.sportslottery.setting.entity.GameEntity;
import tw.com.softleader.sportslottery.setting.entity.LotteryOddsEntity;
import tw.com.softleader.sportslottery.setting.entity.OddsEntity;
import tw.com.softleader.sportslottery.setting.service.GameService;
import tw.com.softleader.sportslottery.setting.service.LotteryOddsService;
import tw.com.softleader.sportslottery.setting.service.LotteryService;
import tw.com.softleader.sportslottery.setting.service.OddsService;
import tw.com.softleader.sportslottery.setting.service.TeamService;

import com.google.gson.Gson;
import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionSupport;
/**
 * 
 * @author nick
 *
 */
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
	
	private GameEntity model;
	private List<GameEntity> models;
	private Logger log = LoggerFactory.getLogger(GameAction.class);
	private Long teamAwayId;
	private Long teamHomeId;
	private InputStream inputStream;
	private String json;
	private String catagory;
	private LocalDate timeFrom, timeTo;
	private String teamName;
	
	private Long complexGameNum;
	private String complexTeamName;
	private Boolean complexIsEnd;
	private LocalDate complexTimeBegin;
	private LocalDate complexTimeEnd;
	private String complexBallType;
	
	
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
		log.debug("select...");
		Long gameId = 0L;
		if (model != null) {
			gameId = model.getId();
		}
		if (gameId != null && gameId > 0) {
			json = new Gson().toJson(service.getById(gameId));
		} else {
			json = new Gson().toJson(service.getComplex(null, null, null, null, null, complexBallType));
		}
		
		inputStream = new ByteArrayInputStream(json.getBytes(StandardCharsets.UTF_8));
	
		return "select";
	}
	
	public String selectNearDays() {
		log.debug("selectNearDays...");
		json = new Gson().toJson(service.getComplex(null, null, false, new LocalDate(), new LocalDate().plusDays(3), complexBallType));
		
		inputStream = new ByteArrayInputStream(json.getBytes(StandardCharsets.UTF_8));
	
		return "selectNearDays";
	}
	
	public String selectNotEnd() {
		log.debug("selectNearDays...");
		json = new Gson().toJson(service.getComplex(null, null, false, null, null, complexBallType));
		
		inputStream = new ByteArrayInputStream(json.getBytes(StandardCharsets.UTF_8));
	
		return "selectNotEnd";
	}
	
	public String update() {
		log.debug("update...");
		String result = null;
		try {
		
			Long gameId = model.getId();
			Long gameScoreAway = model.getGameScoreAway();
			Long gameScoreHome = model.getGameScoreHome();
			
			String su = null;
			String ats = null;
			String sc = null;
			String eo = null;
			
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
			
			oddsService.setIsPass(gameId, su, ats, sc, eo);
			
			GameEntity entity = service.getById(gameId);
			entity.setIsEnd(model.getIsEnd());
			entity.setGameScoreAway(gameScoreAway);
			entity.setGameScoreHome(gameScoreHome);
			
			service.update(entity);
			for (OddsEntity odds : entity.getOdds()) {
				if (odds.getIsPass() == null) {
					odds.setIsPass(false);
				}
				List<LotteryOddsEntity> los = lotteryOddsService.getByOddsId(odds.getId());
				lotteryOddsService.checkStatus(los);
				int count = los.size();
				odds.setCount(new Long(count));
				oddsService.update(odds);
			}
			
			
			result = "success";
		} catch (Exception e) {
			e.printStackTrace();
			result = "failed";
		}
		inputStream = new ByteArrayInputStream(result.getBytes(StandardCharsets.UTF_8));
		return "message";
	}
	
	public String insert() {
		log.debug("insert...");
		String result = null;
		Long gameId = model.getId();
		if (gameId != null && gameId > 0) {
			GameEntity entity = service.getById(gameId);
			entity.setBallType(model.getBallType());
			entity.setGameNum(model.getGameNum());
			entity.setGameTime(model.getGameTime());
			entity.setTeamAway(teamService.getById(teamAwayId));
			entity.setTeamHome(teamService.getById(teamHomeId));
			
			try {
				service.update(entity);
				result = gameId.toString();
			} catch (Exception e) {
				result = "failed";
			}
			
		} else {
			model.setTeamHome(teamService.getById(teamHomeId));
			model.setTeamAway(teamService.getById(teamAwayId));
			model.setIsEnd(false);
			
			try {
				service.update(model);
				model = service.getByGameNum(model.getGameNum());
				result = model.getId().toString();
			} catch (Exception e) {
				result = "failed";
			}
		}
		
		inputStream = new ByteArrayInputStream(result.getBytes(StandardCharsets.UTF_8));
		return "message";
		
	}
	
	public String delete() {
		log.debug("delete...");
		String result = null;
		try {
			model = service.getById(model.getId());
			service.delete(model);
			result = "deleted";
		} catch (Exception e) {
			log.debug("ERRORRRRRRRRRR");
			result = "failed";
		}
		
		inputStream = new ByteArrayInputStream(result.getBytes(StandardCharsets.UTF_8));
		return "message";
	}
	
	public String manager() {
		log.debug("manager");
		if (!StringUtils.isEmpty(catagory)) {
			json = new Gson().toJson(service.getByBallType(catagory));
		} else {
			json = new Gson().toJson(service.getByBallType("Baseball"));
		}
		
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
		
		json = new Gson().toJson(service.getComplex(complexGameNum, complexTeamName, complexIsEnd, complexTimeBegin, complexTimeEnd, complexBallType));
		
		inputStream = new ByteArrayInputStream(json.getBytes(StandardCharsets.UTF_8));

		return "searchHistoryComplexData";
	}
}
