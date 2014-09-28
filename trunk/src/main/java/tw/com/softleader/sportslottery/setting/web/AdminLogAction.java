package tw.com.softleader.sportslottery.setting.web;

import java.io.ByteArrayInputStream;
import java.io.InputStream;
import java.nio.charset.StandardCharsets;
import java.util.List;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import tw.com.softleader.sportslottery.setting.entity.AdminLogEntity;
import tw.com.softleader.sportslottery.setting.service.AdminLogService;

import com.google.gson.Gson;
import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionContext;
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
	private Locale locale = ActionContext.getContext().getLocale();
	
	public Locale getLocale() {
		return locale;
	}
	
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
		json = new Gson().toJson(service.getById(model.getId()));
		inputStream = new ByteArrayInputStream(json.getBytes(StandardCharsets.UTF_8));
		return "select";
	}
	
	public String insert() {
		log.debug("AdminLogAction insert()");
		Long logId = model.getId();
		String result = null;
		try {
			if (logId != null && logId > 0) service.update(model);
			else service.insert(model);
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
		List<Long> sums = service.getSumOfLastYear();
		json = new Gson().toJson(sums);
		return Action.SUCCESS;
	}
	
	public String execute() {
		log.debug("AdminLogAction execute()");
		return Action.SUCCESS;
	}
}
