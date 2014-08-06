/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package tw.com.softleader.sportslottery.setting.web;

import tw.com.softleader.sportslottery.setting.entity.OddsEntity;
import tw.com.softleader.sportslottery.setting.service.OddsService;

import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionSupport;


public class OddsAction extends ActionSupport {
    private OddsEntity entity;
    private OddsService service;
    
    @Override
	public void validate() {
	}
    
    public String select() throws Exception {
    	service.getAll();
    	return Action.SUCCESS;
    }
    
    public String insert() throws Exception {
    	service.insert(entity);
    	return Action.SUCCESS;
    }
    
    public String update() throws Exception {
    	service.update(entity);
    	return Action.SUCCESS;
    }
    
    public String delete() throws Exception {
    	service.delete(entity);
    	return Action.SUCCESS;
    }

	@Override
	public String execute() throws Exception {
		return Action.SUCCESS;
	}
    
}
