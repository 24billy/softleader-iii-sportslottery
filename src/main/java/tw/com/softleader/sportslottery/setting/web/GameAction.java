package tw.com.softleader.sportslottery.setting.web;

import java.io.ByteArrayInputStream;
import java.io.InputStream;
import java.nio.charset.StandardCharsets;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.StringUtils;

import tw.com.softleader.sportslottery.setting.entity.GameEntity;
import tw.com.softleader.sportslottery.setting.service.GameService;
import tw.com.softleader.sportslottery.setting.service.TeamService;

import com.google.gson.Gson;
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
	
	public void setCatagory(String catagory) {
		this.catagory = catagory;
	}

	public String execute(){
		log.debug("execute...");
		
		return SUCCESS;
	}
	
	public String select() {
		log.debug("select...");
		
		inputStream = new ByteArrayInputStream(service.getAllJSON().getBytes(StandardCharsets.UTF_8));
		
		return "select";
	}
	
	
	
	
	
	public String insert() {
		log.debug("insert...");
		model.setTeamHome(teamService.getById(teamHomeId));
		model.setTeamAway(teamService.getById(teamAwayId));
		String result = null;
		try {
			service.update(model);
			result = "SUCCESS";
		} catch (Exception e) {
			result = "FAILED";
		}
		
		inputStream = new ByteArrayInputStream(result.getBytes(StandardCharsets.UTF_8));
		return "insert";
		
	}
	
	public String manager() {
		log.debug("manager");
		
		if (!StringUtils.isEmpty(catagory)) {
			json = new Gson().toJson(service.getByBallType(catagory));
		} else {
			json = new Gson().toJson(service.getAll());
		}
		
		return "manager";
	}
	
}
