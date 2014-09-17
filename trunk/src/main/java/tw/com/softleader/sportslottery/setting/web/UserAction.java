/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package tw.com.softleader.sportslottery.setting.web;

import java.io.ByteArrayInputStream;
import java.io.InputStream;
import java.nio.charset.StandardCharsets;
import java.util.Arrays;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.joda.time.LocalDate;
import org.joda.time.LocalDateTime;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import tw.com.softleader.sportslottery.setting.entity.DepositCardEntity;
import tw.com.softleader.sportslottery.setting.entity.UserEntity;
import tw.com.softleader.sportslottery.setting.service.DepositCardService;
import tw.com.softleader.sportslottery.setting.service.UserService;

import com.google.gson.Gson;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;


public class UserAction extends ActionSupport {
	private static final long serialVersionUID = 2014L;
	
	@Autowired
	private UserService service;
	@Autowired
	private DepositCardService cardService;

	private UserEntity model;
	private String oldUserPassword;
	private String userPassword;
	private String confirm_password;
	private List<UserEntity> models;
	private Logger log = LoggerFactory.getLogger(UserAction.class);
	private String json;
	private InputStream inputStream;
	private LocalDate time;
	private String to;
	private String account;
	private String cardAccount;
	private Long coins;		//把值送進coins讓使用者coins更新
	
	public String getOldUserPassword() {
		return oldUserPassword;
	}

	public void setOldUserPassword(String oldUserPassword) {
		this.oldUserPassword = oldUserPassword;
	}

	public String getConfirm_password() {
		return confirm_password;
	}

	public void setConfirm_password(String confirm_password) {
		this.confirm_password = confirm_password;
	}
	
	public String getUserPassword() {
		return userPassword;
	}

	public void setUserPassword(String userPassword) {
		this.userPassword = userPassword;
	}

	public Long getCoins() {
		return coins;
	}

	public void setCoins(Long coins) {
		this.coins = coins;
	}

	public String getCardAccount() {
		return cardAccount;
	}

	public void setCardAccount(String cardAccount) {
		this.cardAccount = cardAccount;
	}

	public String getCardPassword() {
		return cardPassword;
	}

	public void setCardPassword(String cardPassword) {
		this.cardPassword = cardPassword;
	}

	private String cardPassword;
	
	
	public String getTo() {
		return to;
	}

	public void setTo(String to) {
		this.to = to;
	}

	public String getAccount() {
		return account;
	}

	public void setAccount(String account) {
		this.account = account;
	}

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
		if(userPassword!=null && userPassword.length()>0) {
			model.setUserPassword(userPassword.getBytes());
		}
	}
	
	//更新或新增帳號驗證
	public void iValidate(int select) {
		if(model!=null) {
			if(model.getUserAccount()!=null && model.getUserAccount().length()>3) {
			} else {
				log.debug("帳號問題" + model.getUserAccount());
				this.addFieldError("username", this.getText("invalid.fieldvalue.id"));
			}
			if(userPassword!=null && userPassword.length()>5) {
			} else {
				log.debug("密碼問題" + userPassword);
				this.addFieldError("password", this.getText("invalid.fieldvalue.password"));
			}
			
			switch(select) {
				case 1 : 
					log.debug("iValidate...(驗證1中");
					if(model.getUserEmail()!=null && 
							model.getUserEmail().matches( "^[_a-z0-9-]+([.][_a-z0-9-]+)*@[a-z0-9-]+([.][a-z0-9-]+)*$")) {
						if(this.checkEmail().equals("error")){
							log.debug("信箱已存在");
							addFieldError("mail","此信箱已註冊");
						} else {
							log.debug("信箱可用");
						}
					} else {
						addFieldError("mail","此信箱已註冊");
						log.debug("Email格式不符合");
					}
					break;
				case 2 : 
					log.debug("iValidate...(驗證2中");
					break;
				default: 
					break;
			}
			
		}
	}
	
	//發送新密碼
	public String forgetPassword() {
		int ret = service.forgetPassword(to, account);
		switch(ret) { 
			case 0:
				return SUCCESS;
			case 1:
				this.addFieldError("emailCheck", getText("invalid.fieldvalue.forget.email")); 
				break;
			case 2:
				this.addFieldError("accountCheck", this.getText("invalid.fieldvalue.forget.account"));
				break;
			default: 
				this.addFieldError("orther", this.getText("invalid.fieldvalue.other"));
				break;
		}
		return ERROR;
	}
	
	//會員儲值下注得獎coins修改
	public String coinsUpdate() {
		
		Map session = ActionContext.getContext().getSession();
		UserEntity user = (UserEntity)session.get("user");
		if (coins == null) {
			//log.debug(""+user);
			//儲值
			DepositCardEntity card = cardService.findByCardAccount(cardAccount,
					cardPassword);
			if (card != null) {
				try {
					
					if (card.isState()) {
						user.setCoins(user.getCoins() + card.getPoint());
						service.update(user);
						log.debug("儲值成功");
						card.setUserId(user);
						card.setState(false);
						card.setUseTime(LocalDateTime.now());
						cardService.update(card);
						return SUCCESS;
					} else {
						log.debug("此卡已使用");
//						this.addFieldError("cardError",
//								this.getText("alreadyuse.card"));
						inputStream = new ByteArrayInputStream(this.getText("alreadyuse.card").getBytes(StandardCharsets.UTF_8));
						return ERROR;
					}
				} catch (Exception e) {
					log.debug("coins修改異常");
//					this.addFieldError("cardError",
//							this.getText("fieldvalue.card"));
					inputStream = new ByteArrayInputStream(this.getText("fieldvalue.card").getBytes(StandardCharsets.UTF_8));
					e.printStackTrace();
				}
			} else {
				log.debug("查無此點數卡");
				this.addFieldError("cardError", this.getText("fieldvalue.card"));
				inputStream = new ByteArrayInputStream(this.getText("fieldvalue.card").getBytes(StandardCharsets.UTF_8));
				return ERROR;
			}
			log.debug("coins修改非常異常");
			return ERROR;
		}else {
			try {
				log.debug("12132131131");
				System.out.println(coins);
				user.setCoins(user.getCoins() + coins);
				service.update(user);
				return SUCCESS;
			} catch (Exception e) {
				e.printStackTrace();
			}
			return ERROR;
		}
	}
	
	//搜尋出所有會員資料
	@Override
	public String execute() throws Exception {
		System.out.println("UserAction execute");
		json = new Gson().toJson(service.getAll());
		inputStream = new ByteArrayInputStream(json.getBytes(StandardCharsets.UTF_8));	
		return SUCCESS;
	}
	
	//新增會員
	public String insert() throws Exception {
		log.debug("新增會員資料");
		this.iValidate(1);//驗證資料
		if(this.getFieldErrors().isEmpty()){
			model.setCreator("Guest"); //變數
			model.setModifier("Guest"); //變數
			model.setCreateTime(LocalDateTime.now());
			model.setModifiedTime(LocalDateTime.now());
			model.setCoins(0l);
			//model.setUserPassword(userPassword.getBytes());
			log.debug("Model = {}", model);
			
			try {
				service.insert(model);
			} catch (Exception e) {
				log.debug("!!新增錯誤!!");
				this.addFieldError("other", this.getText("invalid.fieldvalue.other"));
				e.printStackTrace();
				return ERROR;
			}
			return SUCCESS;
		}
		log.debug("有誤");
		return ERROR;
	}
	
	//更新會員資料
	public String update() throws Exception {
		HttpServletRequest request = ServletActionContext.getRequest();
		Map session = ActionContext.getContext().getSession();
		UserEntity userEntity = (UserEntity)session.get("user");
		if(userEntity.getUserEmail().equals(model.getUserEmail())) {
			this.iValidate(2);//驗證資料
		} else {
			this.iValidate(1);//驗證資料
		}
		
		if(getFieldErrors().isEmpty()) {
			log.debug("修改會員資料");
			log.debug("Model = {}", model);
			model.setModifier("Guest");
			model.setModifiedTime(LocalDateTime.now());
			//log.debug(""+userEntity);
			try {
				if (model!=null) {
					log.debug("密碼:" + userPassword);
					if (userPassword!=null && userPassword.length()>5) {
						model.setUserPassword(oldUserPassword.getBytes());
						model = service.encoding(model);
						if(userEntity!=null
								&& Arrays.equals(userEntity.getUserPassword(), model.getUserPassword())) {
							userEntity.setUserPassword(userPassword.getBytes());
							log.debug("密碼驗證成功 可修改密碼");
						} else {
							log.debug("密碼不符合");
							this.addFieldError("passwordError", this.getText("invalid.fieldvalue.password"));
							return ERROR;
						}
					}
					userEntity.setUserName(model.getUserName());
					userEntity.setUserBirthday(model.getUserBirthday());
					userEntity.setUserEmail(model.getUserEmail());
					userEntity.setUserPhone(model.getUserPhone());
					service.update(userEntity);
					log.debug("!!修改成功!!");
					request.setAttribute("updateSuccess", "修改成功");
				}
			} catch (Exception e) {
				log.debug("!!新增錯誤!!");
				this.addFieldError("other", this.getText("invalid.fieldvalue.other"));
				request.setAttribute("updateFail", "修改失敗");
				e.printStackTrace();
			}
			return SUCCESS;
		}
		return ERROR;
	}
	
	//身分證重複驗證
	public String checkUserCardId() {
		String result = ERROR;
		String userCardId = model.getUserCardId().toUpperCase();
		log.debug("檢查身分證是否重複" + userCardId);
		if(service.getByuserCardId(userCardId)==null) {
			log.debug("身分證可使用");
			result = SUCCESS;
		}
		return result;
	}
	
	//Email重複驗證
	public String checkEmail() {
		String result = ERROR;
		log.debug("檢查Email是否存在" + model.getUserEmail());
		Map session = ActionContext.getContext().getSession();
		UserEntity userEntity = (UserEntity)session.get("user");
		if(userEntity!=null && userEntity.getUserEmail().equals(model.getUserEmail())) {
			return SUCCESS;//驗證資料
		}else if (model!=null && model.getUserEmail().length()>0) {
			UserEntity check = service.getByUserEmail(model.getUserEmail());
			if (check == null) {
				log.debug("Email可使用");
				result = SUCCESS;
			} else {
				log.debug("Email存在");
				addFieldError("QueryFail", "Email已存在");
				result = ERROR;
			}
			return result;
		}
		log.debug("model為空值或email未輸入");
		return result;
	}
	
	//帳號重複驗證
	public String check() throws Exception {
		log.debug("check...");
		log.debug("檢查帳號是否存在" + model.getUserAccount());
		
		String result = ERROR;
		if (model!=null && model.getUserAccount().length()>0) {
			UserEntity check = service.getByUserAccount(model.getUserAccount());
			if (check == null) {
				log.debug("不存在");
				result = SUCCESS;
			} else {
				log.debug("存在");
				addFieldError("QueryFail", "帳號已存在");
				result = ERROR;
			}
			return result;
		}
		
		return result;
	}
	
	//登入
	public String login() throws Exception {
		log.debug("login...");

		//測試期間用 無法改密碼
		UserEntity entity2 = service.getById(2l);
		log.debug(entity2.toString());
		entity2.setUserPassword("a123456".getBytes());
		service.update(entity2);
		
		UserEntity entity3 = service.getById(3l);
		log.debug(entity3.toString());
		entity3.setUserPassword("a123456".getBytes());
		service.update(entity3);
		
		//正式程式碼
		UserEntity entity = service.checkLogin(model.getUserAccount(), model);
		log.debug(model.getUserAccount() + " : " + model.getUserPassword());
		if(entity!=null) {
			log.debug("可登入");
			Map<String,UserEntity> session = (Map) ServletActionContext.getContext().getSession();
			session.put("user", entity);
			UserEntity e = session.get("user");
			//log.debug(""+e);
			return SUCCESS;
		} else {
			log.debug("帳號不存在");
			addFieldError("LoginFail","帳號或密碼不正確");
			return INPUT;
		}
	}
	
	//依照帳號找會員
	public String searchByAccount() throws Exception {
		log.debug("searchByAccount...");
		json = new Gson().toJson(service.getByUserAccount(model.getUserAccount()));
		inputStream = new ByteArrayInputStream(json.getBytes(StandardCharsets.UTF_8));
		
		return "searchByAccount";
	}
	
	//依照時間找會員
	public String searchByCreateTime() throws Exception {
		log.debug("searchByCreateTime...");
		
		json = new Gson().toJson(service.getByCreateTime(time));
		inputStream = new ByteArrayInputStream(json.getBytes(StandardCharsets.UTF_8));
		
		return "searchByCreateTime";
	}
}
