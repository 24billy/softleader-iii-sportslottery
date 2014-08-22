/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package tw.com.softleader.sportslottery.setting.web;

import java.util.List;
import java.util.Map;

import org.apache.struts2.ServletActionContext;
import org.joda.time.LocalDateTime;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import tw.com.softleader.sportslottery.setting.entity.UserEntity;
import tw.com.softleader.sportslottery.setting.service.UserService;

import com.opensymphony.xwork2.ActionSupport;


public class UserAction extends ActionSupport {
	private static final long serialVersionUID = 2014L;

	@Autowired
	private UserService service;
	
	private UserEntity model;
	
	private List<UserEntity> models;
	
	private Logger log = LoggerFactory.getLogger(UserAction.class);
	
	private String json;
	
	public String getJson() {
		return json;
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
		
		json = service.getAllJSON();
		log.debug("json = {}", json);
		return SUCCESS;
	}
	
	public String insert() throws Exception {
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
			e.printStackTrace();
			return "FIAL";
		}
		return SUCCESS;
	}
	
	public String update() throws Exception {
		
		log.debug("修改會員資料");
//		model.setModifier("Guest");
//		model.setModifiedTime(LocalDateTime.now());
		log.debug("Model = {}", model);
		
		try {
			service.update(model);
		} catch (Exception e) {
			log.debug("!!修改錯誤!!");
			e.printStackTrace();
		}
		return SUCCESS;
	}
	
	public String check() throws Exception {
		log.debug("check...");
		log.debug("檢查帳號是否存在" + model.getUserAccount());
		
		String result;
		UserEntity check = service.getByUserAccount(model.getUserAccount());
		if(check == null) {
			log.debug("不存在");
			addFieldError("QueryFail","此帳號可以使用");
			result="t";
		} else {
			log.debug("存在");
			addFieldError("QueryFail","帳號已存在");
			result="f";
		}
		return result;
	}
	
	public String login() throws Exception {
		log.debug("login...");
		UserEntity entity = service.checkLogin(model.getUserAccount(), model.getUserPassword());
		if(entity!=null) {
			log.debug("可登入");
			Map<String,UserEntity> session = (Map) ServletActionContext.getContext().getSession();
			session.put("user", entity);
			return SUCCESS;
		} else {
			log.debug("帳號不存在");
			addFieldError("LoginFail","帳號或密碼不正確");
			return INPUT;
		}
	}
}
