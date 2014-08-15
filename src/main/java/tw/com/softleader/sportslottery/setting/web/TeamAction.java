package tw.com.softleader.sportslottery.setting.web;

import java.util.List;

import org.joda.time.LocalDateTime;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import tw.com.softleader.sportslottery.setting.entity.TeamEntity;
import tw.com.softleader.sportslottery.setting.service.TeamService;

import com.opensymphony.xwork2.ActionSupport;

public class TeamAction extends ActionSupport {
	@Autowired
	private TeamService service;
	
	private TeamEntity model;
	
	private List<TeamEntity> models;
	
	private Logger log = LoggerFactory.getLogger(TeamAction.class);

	public TeamService getService() {
		return service;
	}

	public void setService(TeamService service) {
		this.service = service;
	}

	public TeamEntity getModel() {
		return model;
	}

	public void setModel(TeamEntity model) {
		this.model = model;
	}

	public List<TeamEntity> getModels() {
		return models;
	}

	public void setModels(List<TeamEntity> models) {
		this.models = models;
	}

	public Logger getLog() {
		return log;
	}

	public void setLog(Logger log) {
		this.log = log;
	}
	
	@Override
	public void validate() {
		
	}
	
	public String execute(){
		log.debug("execute TeamAction");

		models = service.getAll();
		log.debug("Models = {}", models);
		
		return SUCCESS;
	}
	
	public String delete(){
		log.debug("TeamAction delete");
		log.debug("Model = {}", model);
		try {
			service.delete(model);
		} catch (Exception e) {
			log.debug("!!TeamAction deleteFail!!");
			addFieldError("QueryFail", "Delete Fail : Target already delete");
		}

		models = service.getAll();
		
		return SUCCESS;
	}
	
	public String update() {
		log.debug("TeamAction update");
		model.setModifier("guest");
		model.setModifiedTime(LocalDateTime.now());
		log.debug("Model = {}", model);
		try {
			service.update(model);
		} catch (Exception e) {
			log.debug("!!TeamAction updateFail!!");
			addFieldError("QueryFail","Update Fail : update failed");
		}

		models = service.getAll();
		
		return SUCCESS;
	}
	
	public String insert() {
		log.debug("TeamAction insert");
		
		model.setCreator("guest");
		model.setModifier("guest");
		model.setCreateTime(LocalDateTime.now());
		model.setModifiedTime(LocalDateTime.now());
		
		log.debug("Model = {}", model);
		try {
			service.insert(model);
		} catch (Exception e) {
			log.debug("!!TeamAction insertFail!!");
			addFieldError("QueryFail","Insert Fail : target not found");
		}
		
		models = service.getAll();
		
		return SUCCESS;
	}
}