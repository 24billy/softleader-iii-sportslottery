package tw.com.softleader.sportslottery.setting.web;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import tw.com.softleader.sportslottery.setting.entity.GameEntity;
import tw.com.softleader.sportslottery.setting.service.GameService;

import com.opensymphony.xwork2.ActionSupport;
/**
 * 
 * @author nick
 *
 */
public class GameAction extends ActionSupport {
 
	@Autowired
	private GameService service;
	
	private GameEntity model;
	
	private List<GameEntity> models;
	
	private Logger log = LoggerFactory.getLogger(GameAction.class);
	
	public GameService getService() {
		return service;
	}
	public void setService(GameService service) {
		this.service = service;
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
	
	public Logger getLog() {
		return log;
	}
	public void setLog(Logger log) {
		this.log = log;
	}
	
	
	public String execute(){
		log.debug("execute GameAction");

		models = service.getAll();
		log.debug("Models = {}", models);
		
		return SUCCESS;
	} 
}
