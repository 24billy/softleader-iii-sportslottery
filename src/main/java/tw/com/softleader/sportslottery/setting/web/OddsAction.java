/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package tw.com.softleader.sportslottery.setting.web;

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
	private Logger log = LoggerFactory.getLogger(OddsAction.class);
    private OddsEntity model;
    private List<OddsEntity> models;
    private String modelsJson;
    private Long gameId;
    
    @Autowired
    private OddsService service;
    
    public OddsEntity getModel() {
		return model;
	}

	public void setModel(OddsEntity model) {
		this.model = model;
	}

	public List<OddsEntity> getModels() {
		return models;
	}

	public void setModels(List<OddsEntity> models) {
		this.models = models;
	}

	public String getModelsJson() {
		return modelsJson;
	}

	public void setModelsJson(String modelsJson) {
		this.modelsJson = modelsJson;
	}
	
	public Long getGameId() {
		return gameId;
	}

	public void setGameId(Long gameId) {
		this.gameId = gameId;
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
    
    public String insert() throws Exception {
    	log.debug("insert...");
    	service.insert(model);
    	return Action.SUCCESS;
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
			modelsJson = service.getByGameIdJson(gameId);
		} else {
			modelsJson = service.getByOddTypeJson("SU");
		}
		//modelsJson = service.getAllJSON();
		log.debug("modelsJson = {}", modelsJson);
		return Action.SUCCESS;
	}
    
}
