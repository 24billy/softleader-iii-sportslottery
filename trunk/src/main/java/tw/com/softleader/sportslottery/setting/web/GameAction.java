package tw.com.softleader.sportslottery.setting.web;

import java.io.ByteArrayInputStream;
import java.io.InputStream;
import java.nio.charset.StandardCharsets;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

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
 
	@Autowired
	private GameService service;
	@Autowired
	private TeamService teamService;
	private GameEntity model;
	private List<GameEntity> models;
	private String modelsJson;
	private Logger log = LoggerFactory.getLogger(GameAction.class);
	private Long teamAwayId;
	private Long teamHomeId;
	private InputStream inputStream;
	
	public String getModelsJson() {
		return modelsJson;
	}
	public void setModelsJson(String modelsJson) {
		this.modelsJson = modelsJson;
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
	public void setModels(List<GameEntity> models) {
		this.models = models;
	}
	
	public Long getTeamAwayId() {
		return teamAwayId;
	}
	public void setTeamAwayId(Long teamAwayId) {
		this.teamAwayId = teamAwayId;
	}
	public Long getTeamHomeId() {
		return teamHomeId;
	}
	public void setTeamHomeId(Long teamHomeId) {
		this.teamHomeId = teamHomeId;
	}
	
	public InputStream getInputStream() {
		return inputStream;
	}

	public void setInputStream(InputStream inputStream) {
		this.inputStream = inputStream;
	}
	
	public String execute(){
		log.debug("execute GameAction");

		//models = service.getAll();
		//log.debug("Models = {}", models);
		
		//inputStream = new ByteArrayInputStream((new Gson().toJson(models).getBytes(StandardCharsets.UTF_8)));
		inputStream = new ByteArrayInputStream(service.getAllJSON().getBytes(StandardCharsets.UTF_8));
		//modelsJson = service.getAllJSON();//將Game的讀出資料轉為Json
		//log.debug("modelsJson = {}", modelsJson);
		
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
		try {
			service.insert(model);
			return "inserted";
		} catch (Exception e) {
			return "insertFailed";
		}

	}
	
	
	
}
