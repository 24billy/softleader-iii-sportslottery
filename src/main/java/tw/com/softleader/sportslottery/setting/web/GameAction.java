package tw.com.softleader.sportslottery.setting.web;

import java.io.ByteArrayInputStream;
import java.io.InputStream;
import java.nio.charset.StandardCharsets;
import java.util.List;

import org.joda.time.LocalDate;
import org.joda.time.LocalDateTime;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.StringUtils;

import tw.com.softleader.sportslottery.setting.entity.GameEntity;
import tw.com.softleader.sportslottery.setting.service.GameService;
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
			json = new Gson().toJson(service.getAll());
		}
		
		inputStream = new ByteArrayInputStream(json.getBytes(StandardCharsets.UTF_8));
	
		return "select";
	}
	
	public String selectNearDays() {
		log.debug("selectNearDays...");
		json = new Gson().toJson(service.getComplex(null, null, false, new LocalDate().minusDays(3), null, null));
		
		inputStream = new ByteArrayInputStream(json.getBytes(StandardCharsets.UTF_8));
	
		return "selectNearDays";
	}
	
	public String update() {
		log.debug("update...");
		boolean status = model.getIsEnd();
		model = service.getById(model.getId());
		model.setIsEnd(status);
		String result = null;
		try {
			service.update(model);
			result = "success";
		} catch (Exception e) {
			result = "failed";
		}
		inputStream = new ByteArrayInputStream(result.getBytes(StandardCharsets.UTF_8));
		return "message";
	}
	
	public String insert() {
		log.debug("insert...");
		model.setTeamHome(teamService.getById(teamHomeId));
		model.setTeamAway(teamService.getById(teamAwayId));
		model.setIsEnd(false);
		String result = null;
		try {
			service.update(model);
			model = service.getByGameNum(model.getGameNum());
			result = model.getId().toString();
		} catch (Exception e) {
			result = "failed";
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
