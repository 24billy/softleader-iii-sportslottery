/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package tw.com.softleader.sportslottery.setting.web;

import java.io.ByteArrayInputStream;
import java.io.InputStream;
import java.nio.charset.StandardCharsets;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import tw.com.softleader.sportslottery.setting.entity.OddsEntity;
import tw.com.softleader.sportslottery.setting.service.OddsService;

import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionSupport;

/**
 * 
 * @author ebikyatto
 *
 */

public class OddsAction extends ActionSupport {
	private static final long serialVersionUID = 2014L;
	
	private Logger log = LoggerFactory.getLogger(OddsAction.class);
    private OddsEntity model;
    private List<OddsEntity> models;
    private Long gameId;
    private InputStream inputStream;
    
    @Autowired
    private OddsService service;
    
    private String json;
	
	public String getJson() {
		return json;
	}
    
    public OddsEntity getModel() {
		return model;
	}

	public void setModel(OddsEntity model) {
		this.model = model;
	}

	public List<OddsEntity> getModels() {
		return models;
	}

	public void setGameId(Long gameId) {
		this.gameId = gameId;
	}

	public InputStream getInputStream() {
		return inputStream;
	}

	@Override
	public void validate() {
	}

	public String select() throws Exception {
    	log.debug("select...");
    	model = service.getById(model.getId());
    	log.debug("model = {}", model);
    	return Action.SUCCESS;
    }
    
    public String insert() {
    	log.debug("insert...");
    	String result = null;
    	try {
    		service.insert(model);
    		result = "SUCCESS";
    	} catch (Exception e) {
    		result = "FAILED";
    	}
    	
    	inputStream = new ByteArrayInputStream(result.getBytes(StandardCharsets.UTF_8));
    	return "insert";
    }
    
    public String update() throws Exception {
    	log.debug("update...");
    	service.update(model);
    	return Action.SUCCESS;
    }
    
    public String delete() throws Exception {
    	log.debug("delete...");
    	service.delete(model);
    	return Action.SUCCESS;
    }

	@Override
	public String execute() throws Exception {
		log.debug("service...");
		models = service.getAll();
		log.debug("models = {}", models);
		
		if (gameId != null && gameId > 0L) {
			json = service.getByGameIdJson(gameId);
			log.debug("json = {}", json);
			return "byGameId";
		} else {
			json = service.getByOddTypeJson("SU");
			log.debug("json = {}", json);
			return Action.SUCCESS;
		}
	}
    
}
