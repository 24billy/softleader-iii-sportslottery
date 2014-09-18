package tw.com.softleader.sportslottery.setting.web;

import java.io.ByteArrayInputStream;
import java.io.InputStream;
import java.nio.charset.StandardCharsets;
import java.util.List;

import org.joda.time.LocalDateTime;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import tw.com.softleader.sportslottery.setting.entity.AnnounceEntity;
import tw.com.softleader.sportslottery.setting.service.AnnounceService;

import com.google.gson.Gson;
import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionSupport;

public class AnnounceAction extends ActionSupport {

	private static final long serialVersionUID = 2014L;
	private Logger log = LoggerFactory.getLogger(AnnounceAction.class);
	@Autowired
	private AnnounceService service;
	private List<AnnounceEntity> models;
	private AnnounceEntity model;
	private String json;
	private InputStream inputStream;
	
	public String getJson() {
		return json;
	}

	public List<AnnounceEntity> getModels() {
		return models;
	}
	
	public void setModel(AnnounceEntity model) {
		this.model = model;
	}
	
	public AnnounceEntity getModel() {
		return model;
	}

	public InputStream getInputStream() {
		return inputStream;
	}
	
	public String select() {
		log.debug("AnnounceAction select()");
		Long announceId = null;
		if (model != null) {
			announceId = model.getId();
		}
		if (announceId != null && announceId > 0) {
			json = new Gson().toJson(service.getById(announceId));
		}
		inputStream = new ByteArrayInputStream(json.getBytes(StandardCharsets.UTF_8));
	
		return "select";
	}
	
	public String selectLatestFiveRecord() {
		log.debug("AnnounceAction selectLatestFiveRecord()");
		json = new Gson().toJson(service.getLatestFiveRecord());
		inputStream = new ByteArrayInputStream(json.getBytes(StandardCharsets.UTF_8));
		return "select";
	}
	
	public String insert() {
		log.debug("AnnounceAction insert()");
		log.debug("model = {}", model);
		String result = null;
		Long announceId = model.getId();
		String announceTitle = model.getAnnounceTitle();
		String announceContent = model.getAnnounceContent();
		LocalDateTime announceTime = LocalDateTime.now();
		LocalDateTime modifiedTime = LocalDateTime.now();
		try {
			if (announceId != null && announceId > 0) {
				model = service.getById(announceId);
				model.setAnnounceTitle(announceTitle);
				model.setAnnounceContent(announceContent);
				model.setModifiedTime(modifiedTime);
			} else {
				model.setAnnounceTime(announceTime);
				model.setModifiedTime(modifiedTime);
			}
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
		log.debug("AnnounceAction delete()");
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
		log.debug("AnnounceAction admin()");
		models = service.getAll();
		json = new Gson().toJson(models);
		
		return Action.SUCCESS;
	}
	
	public String execute() {
		log.debug("AnnounceAction execute()");
		return Action.SUCCESS;
	}

}
