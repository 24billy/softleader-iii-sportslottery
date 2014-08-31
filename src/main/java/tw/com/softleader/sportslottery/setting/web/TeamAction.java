package tw.com.softleader.sportslottery.setting.web;

import java.io.ByteArrayInputStream;
import java.io.InputStream;
import java.nio.charset.StandardCharsets;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.StringUtils;

import tw.com.softleader.sportslottery.setting.entity.TeamEntity;
import tw.com.softleader.sportslottery.setting.service.TeamService;

import com.google.gson.Gson;
import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionSupport;

public class TeamAction extends ActionSupport {
	private static final long serialVersionUID = 2014L;

	@Autowired
	private TeamService service;
	
	private TeamEntity model;
	
	private List<TeamEntity> models;
	
	private InputStream inputStream;
	
	private Logger log = LoggerFactory.getLogger(TeamAction.class);
	
	private String json;
	private String country;
	
	public String getCountry() {
		return country;
	}
	public void setCountry(String country) {
		this.country = country;
	}
	public String getJson() {
		return json;
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
	
	public InputStream getInputStream() {
		return inputStream;
	}

	@Override
	public void validate() {
		
//		if(model.getTeamName()==null|| model.getTeamName().trim().length()==0){
//			this.addFieldError("teamName", "teamName must be inserted");
//		}
		
		
	}
	
	public String execute(){
		log.debug("execute TeamAction");
		json = new Gson().toJson(service.getAll());
		inputStream = new ByteArrayInputStream(json.getBytes(StandardCharsets.UTF_8));
		
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
//		model.setModifier("guest");
//		model.setModifiedTime(LocalDateTime.now());
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
		log.debug("Model = {}", model);
		try {
			service.insert(model);
		} catch (Exception e) {
			log.debug("!!TeamAction insertFail!!");
			addFieldError("QueryFail","Insert Fail : target not found");
		}
		
		json = new Gson().toJson(service.getAll());
		
		return Action.SUCCESS;
	}
	
	public String manager() {
		log.debug("manager...");
		
		if (!StringUtils.isEmpty(country)) {
			json = new Gson().toJson(service.getTeamsByCountry(country));
		} else {
			json = new Gson().toJson(service.getAll());
		}
		
		return Action.SUCCESS;
	}
	
	public String teamsByCountry() {
		log.debug("TeamsByCountry...");
		return SUCCESS;
	}
	public String getTeamsByCountry(){
		
		json= new Gson().toJson(service.getTeamsByCountry(country));
		inputStream = new ByteArrayInputStream(json.getBytes(StandardCharsets.UTF_8));
		return "getTeamsByCountry";
	}
}
