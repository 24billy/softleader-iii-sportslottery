package tw.com.softleader.sportslottery.setting.web;

import java.io.ByteArrayInputStream;
import java.io.InputStream;
import java.nio.charset.StandardCharsets;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import tw.com.softleader.sportslottery.setting.entity.AdminLogEntity;
import tw.com.softleader.sportslottery.setting.service.AdminLogService;

import com.google.gson.Gson;
import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionSupport;

public class AdminLogAction extends ActionSupport {

	private static final long serialVersionUID = 2014L;
	private Logger log = LoggerFactory.getLogger(AdminLogAction.class);
	@Autowired
	private AdminLogService service;
	private List<AdminLogEntity> models;
	private AdminLogEntity model;
	private String json;
	private InputStream inputStream;
	
	public String getJson() {
		return json;
	}

	public List<AdminLogEntity> getModels() {
		return models;
	}
	
	public AdminLogEntity getModel() {
		return model;
	}

	public void setModel(AdminLogEntity model) {
		this.model = model;
	}
	
	public InputStream getInputStream() {
		return inputStream;
	}

	public String select() {
		log.debug("AdminLogAction select()");
		Long adminLogId = null;
		if (model != null) {
			adminLogId = model.getId();
		}
		if (adminLogId != null && adminLogId > 0) {
			json = new Gson().toJson(service.getById(adminLogId));
		}
		inputStream = new ByteArrayInputStream(json.getBytes(StandardCharsets.UTF_8));
	
		return "select";
	}
	
	public String insert() {
		log.debug("AdminLogAction insert()");
		String result = null;
		try {
			service.update(model);
			result = "success";
		} catch (Exception e) {
			e.printStackTrace();
			result = "failed";
		}
		inputStream = new ByteArrayInputStream(result.getBytes(StandardCharsets.UTF_8));
		
		return "message";
	}
	
	public String delete() {
		log.debug("AdminLogAction delete()");
		String result = null;
		try {
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
		log.debug("AdminLogAction admin()");
		models = service.getAll();
		json = new Gson().toJson(models);
		
		return Action.SUCCESS;
	}
	
	public String execute() {
		log.debug("AdminLogAction execute()");
		return Action.SUCCESS;
	}

}
