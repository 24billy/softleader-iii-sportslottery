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
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;
import org.joda.time.LocalDate;
import org.joda.time.LocalDateTime;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import tw.com.softleader.sportslottery.setting.entity.UserEntity;
import tw.com.softleader.sportslottery.setting.service.UserService;

import com.google.gson.Gson;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;


public class UserAction extends ActionSupport {
	private static final long serialVersionUID = 2014L;

	@Autowired
	private UserService service;
	
	private UserEntity model;
	
	private List<UserEntity> models;
	
	private Logger log = LoggerFactory.getLogger(UserAction.class);
	
	private String json;
	
	private InputStream inputStream;
	
	private LocalDate time;
	
	
	public void setTime(LocalDate time) {
		this.time = time;
	}

	public void setModel(UserEntity model) {
		this.model = model;
	}
	
	public String getJson() {
		return json;
	}
	
	public UserEntity getModel() {
		return model;
	}

	public List<UserEntity> getModels() {
		return models;
	}

	public InputStream getInputStream() {
		return inputStream;
	}
	
	@Override
	public void validate() {
		log.debug("here is userAction validate");
		

		
//		if(model!=null) {
//			if(model.getUserAccount() != null && model.getUserAccount().length()>5) {
//			} else {
//				log.debug("帳號問題");
//				this.addFieldError("username", this.getText("invalid.fieldvalue.id"));
//			}
//			if(model.getUserPassword() != null && model.getUserPassword().length()>5) {
//			} else {
//				log.debug("密碼問題");
//				this.addFieldError("password", this.getText("invalid.fieldvalue.password"));
//			}
			
			
		
//			if(model.getUserPassword() != null) {
//				log.debug("信箱已存在");
//				addFieldError("QueryFail","此信箱已註冊");
//			} else {
//				log.debug("密碼空白");
//				addFieldError("QueryFail","密碼不可空白");
//			}
//		}

	}
	
	@Override
	public String execute() throws Exception {
		System.out.println("UserAction execute");
		json = new Gson().toJson(service.getAll());
		inputStream = new ByteArrayInputStream(json.getBytes(StandardCharsets.UTF_8));
		
		return SUCCESS;
	}
	
	public String insert() throws Exception {
		log.debug("新增會員資料");
		if(this.getFieldErrors().isEmpty()){
			model.setCreator("Guest"); //變數
			model.setModifier("Guest"); //變數
			model.setCreateTime(LocalDateTime.now());
			model.setModifiedTime(LocalDateTime.now());
			
			log.debug("Model = {}", model);
			
			try {
				service.insert(model);
			} catch (Exception e) {
				log.debug("!!新增錯誤!!");
				this.addFieldError("email", this.getText("invalid.fieldvalue.other"));
				e.printStackTrace();
				return INPUT;
			}
			return SUCCESS;
		}
		log.debug("有誤");
		return INPUT;
	}
	
	public String update() throws Exception {
		
		log.debug("修改會員資料");
		log.debug("Model = {}", model);
		//model.setModifier("Guest");
		//model.setModifiedTime(LocalDateTime.now());
		HttpServletRequest request = ServletActionContext.getRequest();
		Map upSuccess = ActionContext.getContext().getSession();
		UserEntity userEntity = (UserEntity)upSuccess.get("user");
		
		
		try {
			if (model!=null) {
				userEntity.setUserName(model.getUserName());
				userEntity.setUserBirthday(model.getUserBirthday());
				userEntity.setUserEmail(model.getUserEmail());
				userEntity.setUserPhone(model.getUserPhone());
				userEntity.setUserPassword(model.getUserPassword());
				userEntity.setUserGender(model.getUserGender());
				
				service.update(userEntity);
				log.debug("!!修改成功!!");
				request.setAttribute("updateSuccess", "修改成功");
			}
		} catch (Exception e) {
			log.debug("!!新增錯誤!!");
			this.addFieldError("email", this.getText("invalid.fieldvalue.other"));
			request.setAttribute("updateFail", "修改失敗");
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
			result="success";
		} else {
			log.debug("存在");
			addFieldError("QueryFail","帳號已存在");
			result="fail";
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
			UserEntity e = session.get("user");
			log.debug(e.getUserAccount());
			return SUCCESS;
		} else {
			log.debug("帳號不存在");
			addFieldError("LoginFail","帳號或密碼不正確");
			return INPUT;
		}
	}
	
	public String searchByAccount() throws Exception {
		log.debug("searchByAccount...");
		
		json = new Gson().toJson(service.getByUserAccount(model.getUserAccount()));
		inputStream = new ByteArrayInputStream(json.getBytes(StandardCharsets.UTF_8));
		
		return "searchByAccount";
	}
	
	public String searchByCreateTime() throws Exception {
		log.debug("searchByCreateTime...");
		
		json = new Gson().toJson(service.getByCreateTime(time));
		inputStream = new ByteArrayInputStream(json.getBytes(StandardCharsets.UTF_8));
		
		return "searchByCreateTime";
	}
}
