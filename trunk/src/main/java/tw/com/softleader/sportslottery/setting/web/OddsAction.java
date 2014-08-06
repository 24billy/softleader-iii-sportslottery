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

public class OddsAction extends ActionSupport {
	private Logger log = LoggerFactory.getLogger(OddsAction.class);
    private OddsEntity entity;
    private List<OddsEntity> entitys;
    
    @Autowired
    private OddsService service;
    
    @Override
	public void validate() {
	}
    
    public String select() throws Exception {
    	log.debug("select...");
    	entity = service.getById(entity.getId());
    	log.debug("entity = {}", entity);
    	return Action.SUCCESS;
    }
    
    public String insert() throws Exception {
    	log.debug("insert...");
    	service.insert(entity);
    	return Action.SUCCESS;
    }
    
    public String update() throws Exception {
    	log.debug("update...");
    	service.update(entity);
    	return Action.SUCCESS;
    }
    
    public String delete() throws Exception {
    	log.debug("delete...");
    	service.delete(entity);
    	return Action.SUCCESS;
    }

	@Override
	public String execute() throws Exception {
		log.debug("service...");
		entitys = service.getAll();
		log.debug("entitys = {}", entitys);
		return Action.SUCCESS;
	}
    
}
