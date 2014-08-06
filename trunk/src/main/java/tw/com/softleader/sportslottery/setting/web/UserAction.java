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

import com.opensymphony.xwork2.ActionSupport;

import tw.com.softleader.sportslottery.setting.entity.UserEntity;
import tw.com.softleader.sportslottery.setting.service.UserService;


public class UserAction extends ActionSupport {
	@Autowired
	private UserService service;
	
	private UserEntity model;
	
	private List<UserEntity> models;
	
	private Logger log = LoggerFactory.getLogger(UserAction.class);
	
	@Override
	public String execute() throws Exception {
		System.out.println("here is execute");
		// TODO Auto-generated method stub
		return super.execute();
	}

	@Override
	public void validate() {
		System.out.println("here is validate");
		// TODO Auto-generated method stub
		super.validate();
	}

	public UserService getService() {
		return service;
	}

	public void setService(UserService service) {
		this.service = service;
	}

	public UserEntity getModel() {
		return model;
	}

	public void setModel(UserEntity model) {
		this.model = model;
	}

	public List<UserEntity> getModels() {
		return models;
	}

	public void setModels(List<UserEntity> models) {
		this.models = models;
	}
	
}
