/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package tw.com.softleader.sportslottery.setting.web;

import java.util.List;

import org.joda.time.LocalDateTime;
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
	
	private String modelsJson;
	
	private Logger log = LoggerFactory.getLogger(UserAction.class);
	
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
	
	public String getModelsJson() {
		return modelsJson;
	}

	public void setModelsJson(String modelsJson) {
		this.modelsJson = modelsJson;
	}

	@Override
	public void validate() {
//		log.debug("here is validate");
//		
//		if(model!=null) {
//			if(model.getUSER_ACCOUNT() != null) {
//				log.debug("帳號已存在");
//				addFieldError("QueryFail","帳號已存在");
//			}
//			if(model.getUSER_PHONE() != null) {
//				log.debug("電話已存在");
//				addFieldError("QueryFail","此電話已註冊");
//			}
//			if(model.getUSER_EMAIL() != null) {
//				log.debug("信箱已存在");
//				addFieldError("QueryFail","此信箱已註冊");
//			}
//		}
	}
	
	@Override
	public String execute() throws Exception {
		System.out.println("here is execute");
		
		models = service.getAll();
		log.debug("Models = {}", models);
		
		modelsJson = service.getAllJSON();
		log.debug("modelsJson = {}", modelsJson);
		return SUCCESS;
	}
	
	public String insert() {
		log.debug("新增會員資料");
		
		model.setCreator("Guest"); //變數
		model.setModifier("Guest"); //變數
		model.setCreateTime(LocalDateTime.now());
		model.setModifiedTime(LocalDateTime.now());
		
		log.debug("Model = {}", model);
		
		try {
			service.insert(model);
		} catch (Exception e) {
			log.debug("!!新增錯誤!!");
			addFieldError("QueryFail","帳號已存在");
		}
		
		return SUCCESS;
	}
	
	public String update() {
		
		log.debug("修改會員資料");
		model.setModifier("Guest");
		model.setModifiedTime(LocalDateTime.now());
		log.debug("Model = {}", model);
		
		try {
			service.update(model);
		} catch (Exception e) {
			log.debug("!!修改錯誤!!");
			e.printStackTrace();
		}

		//models = service.getAll();
		
		return SUCCESS;
	}
	
	public String check() {
		log.debug("check...");
		log.debug("檢查帳號是否存在" + model.getUSER_ACCOUNT());
		log.debug("check2...");
		String result;
		String check = service.getByUserAccount(model.getUSER_ACCOUNT());
		if(check!=null) {
			addFieldError("QueryFail","帳號已存在");
			result="f";
		} else {
			addFieldError("QueryFail","此帳號可以使用");
			result="t";
		}
		return result;
	}
	
}
