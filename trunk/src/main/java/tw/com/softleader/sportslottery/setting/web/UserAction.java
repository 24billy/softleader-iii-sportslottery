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
import java.util.Locale;
import java.util.Map;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;

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
	private String lockCharacter;
	
	private Locale locale = ActionContext.getContext().getLocale();
	
	public Locale getLocale() {
		return locale;
	}
	
	public String getLockCharacter() {
		return lockCharacter;
	}

	public void setLockCharacter(String lockCharacter) {
		this.lockCharacter = lockCharacter;
	}

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
		if(userPassword!=null && userPassword.length()>0) {
			model.setUserPassword(userPassword.getBytes());
		}
	}
	
	//更新或新增帳號驗證
	public void iValidate(int select) {
		getFieldErrors().clear();
		if(model!=null) {
			switch(select) {
				case 1 : 
					log.debug("iValidate...(新增會員驗證中...");
					if(model.getUserAccount()!=null &&
							model.getUserAccount().matches("^[a-zA-Z0-9]\\S{5,}$")) {
						this.check();
					}else {
						this.addFieldError("username", this.getText("invalid.fieldvalue.id"));
						log.debug("帳號問題" + model.getUserAccount());
					}
					if(userPassword==null || userPassword.length()<5 ||
							!userPassword.matches(".*[0-9].*") ||
							!userPassword.matches(".*[A-Za-z].*") ||
							!userPassword.matches("^[a-zA-Z0-9]+$")) {
						this.addFieldError("password", this.getText("invalid.fieldvalue.password"));
						log.debug("密碼問題" + userPassword);
					}
					if(confirm_password==null || !confirm_password.equals(userPassword)) {
						this.addFieldError("confirm_password", this.getText("invalid.fieldvalue.confirm_password"));
						log.debug("密碼不匹配" + confirm_password + ":" + userPassword);
					}
					if(model.getUserBirthday()!=null) {
						try {
							LocalDate checkDate = new LocalDate();
							if((checkDate.getValue(0)-model.getUserBirthday().getValue(0)) < 18 || 
									((checkDate.getValue(0)-model.getUserBirthday().getValue(0)) == 18 &&
									(model.getUserBirthday().getValue(1)-checkDate.getValue(1)) > 0) ||
									((checkDate.getValue(0)-model.getUserBirthday().getValue(0)) == 18 &&
									(model.getUserBirthday().getValue(1)-checkDate.getValue(1)) == 0 &&
									(model.getUserBirthday().getValue(2)-checkDate.getValue(2) > 0))) {
								addFieldError("userBirth", this.getText("invalid.fieldvalue.birth"));
								log.debug(checkDate+"年齡不足"+model.getUserBirthday());
							}
						} catch(Exception e) {
							addFieldError("userBirth", this.getText("invalid.fieldvalue.birth"));
							log.debug("日期轉換問題");
						}
					}
					if(model.getUserEmail()!=null && 
							model.getUserEmail().matches( "^[_a-z0-9-]+([.][_a-z0-9-]+)*@[a-z0-9-]+([.][a-z0-9-]+)*$")) {						
						this.checkEmail().equals("error");
					} else {
						addFieldError("mail","mail格式不符");
						log.debug("Email格式不符合");
					}
					if(model.getUserName()==null ||
							!model.getUserName().matches("^[\\u4E00-\\u9FA5]+$")) {
						addFieldError("name",this.getText("invalid.fieldvalue.name"));
						log.debug("姓名只能輸入中文" + model.getUserName());
					}
					if(model.getUserCardId()!=null && isValidTWPID(model.getUserCardId())) {
						this.checkUserCardId();
					}else {
						this.addFieldError("userCardId", this.getText("invalid.fieldvalue.cardid"));
						log.debug("身分證不符");
					}
					if(model.getUserPhone()!=null && model.getUserPhone().length()<14) {
						try {
							Double userBank = Double.parseDouble(model.getUserPhone());
						} catch (NumberFormatException e) {
							this.addFieldError("phone", this.getText("invalid.fieldvalue.bank"));
							log.debug("電話不是數字");
						}
					}else {
						this.addFieldError("phone", this.getText("invalid.fieldvalue.phone"));
						log.debug("電話格式不對");
					}
					if(model.getUserBankAccount()!=null && model.getUserBankAccount().replaceAll("-", "").length()==14 &&
							!model.getUserBankAccount().matches(".*[eE].*")) {
						String temp = model.getUserBankAccount().replaceAll("-", "");
						try {
							Double userBank = Double.parseDouble(temp);
						} catch (NumberFormatException e) {
							this.addFieldError("userBankAccount", this.getText("invalid.fieldvalue.bank"));
							log.debug("銀行帳不是數字");
						}
					}else {
						this.addFieldError("userBankAccount", this.getText("invalid.fieldvalue.bank"));
						log.debug("銀行帳格式不符" + model.getUserBankAccount());
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
	
	public String onLock() {
		Map session = ActionContext.getContext().getSession();
		UserEntity user = (UserEntity)session.get("user");
		if(user.getUserState().equals(lockCharacter)) {
			user.setUserState("0");
			user = service.noPswdUpdate(user);
			session.put("user", user);
		}else {
			log.debug("驗證碼不正確");
			return ERROR;
		}
		return SUCCESS;
	}
	public String sendLock() {
		Map session = ActionContext.getContext().getSession();
		UserEntity user = (UserEntity)session.get("user");
		return service.sendLockmail(user);
	}
	
	//發送新密碼
	public String forgetPassword() {
		String message = null;
		int ret = service.forgetPassword(to, account);
		switch(ret) { 
			case 0:
				return SUCCESS;
			case 1:
				message = new Gson().toJson(getText("invalid.fieldvalue.forget.email"));
				//addFieldError("emailCheck", getText("invalid.fieldvalue.forget.email")); 
				break;
			case 2:
				message = new Gson().toJson(this.getText("invalid.fieldvalue.forget.account"));
				//this.addFieldError("accountCheck", this.getText("invalid.fieldvalue.forget.account"));
				break;
			default: 
				message = new Gson().toJson(this.getText("invalid.fieldvalue.other"));
				//this.addFieldError("orther", this.getText("invalid.fieldvalue.other"));
				break;
		}
		inputStream = new ByteArrayInputStream(message.getBytes(StandardCharsets.UTF_8));
		//inputStream = new ByteArrayInputStream(message.getBytes(StandardCharsets.UTF_8));
		return ERROR;
	}
	
	//會員儲值下注得獎coins修改
	public String coinsUpdate() {
		String message = null;
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
						//log.debug("coins"+card.getPoint());
						message = card.getPoint().toString();
						card.setUserId(user);
						card.setState(false);
						service.update(user);
						log.debug("儲值成功");
						card.setUseTime(LocalDateTime.now());
						cardService.update(card);
					} else {
						log.debug("此卡已使用");
//						this.addFieldError("cardError",
//								this.getText("alreadyuse.card"));
						message = "error 此卡已使用";
					}
				} catch (Exception e) {
					log.debug("coins修改異常");
//					this.addFieldError("cardError",
//							this.getText("fieldvalue.card"));
					message = "error coins修改異常";
					e.printStackTrace();
				}
			} else {
				log.debug("查無此點數卡");
				this.addFieldError("cardError", this.getText("fieldvalue.card"));
				message = "error 查無此點數卡";
			}
			log.debug("coins修改非常異常");
		}else {
			try {
				user.setCoins(user.getCoins() + coins);
				message = new Gson().toJson(service.update(user));
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		inputStream = new ByteArrayInputStream(message.getBytes(StandardCharsets.UTF_8));
		return "message";
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
			model.setUserState(new String(service.getNewPassword()));
			String cardId = model.getUserCardId().toUpperCase();
			model.setUserCardId(cardId);
			//model.setUserPassword(userPassword.getBytes());
			log.debug("Model = {}", model);
			
			try {
				service.insert(model);
				UserEntity entity = service.getByUserAccount(model.getUserAccount());
				log.debug("新會員"+entity);
				Map<String,UserEntity> session = (Map) ServletActionContext.getContext().getSession();
				session.put("user", entity);
				log.debug("註冊成功");
			} catch (Exception e) {
				log.debug("!!新增錯誤!!");
				this.addFieldError("other", this.getText("invalid.fieldvalue.other"));
				e.printStackTrace();
				return ERROR;
			}
			return SUCCESS;
		} else {
			log.debug("有誤" + getFieldErrors().toString());
			return ERROR;
		}
	}
	
	//取出會員資料
	public String select() {
		HttpServletRequest request = ServletActionContext.getRequest();
		Map session = ActionContext.getContext().getSession();
		UserEntity userEntity = (UserEntity)session.get("user");
		
		json = new Gson().toJson(userEntity);
		inputStream = new ByteArrayInputStream(json.getBytes(StandardCharsets.UTF_8));
		
		return "select";
	}
	
	//更新會員資料
	public String update() throws Exception {
		HttpServletRequest request = ServletActionContext.getRequest();
		Map session = ActionContext.getContext().getSession();
		UserEntity userEntity = (UserEntity)session.get("user");
		
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
	
	//驗證會員登入 
	public String checkUser(){
		log.debug(model.getUserAccount() + " : " + model.getUserPassword());
		UserEntity entity = service.checkLogin(model.getUserAccount(), model);
		if(entity!=null) {
			log.debug("登入驗證成功");
			inputStream = new ByteArrayInputStream("true".getBytes(StandardCharsets.UTF_8));
		} else {
			log.debug("登入驗證失敗");
			addFieldError("LoginFail","帳號或密碼不正確");
			inputStream = new ByteArrayInputStream("false".getBytes(StandardCharsets.UTF_8));
		}
		return "checkUser";
	}
	
	// 更新會員資料
	public String updateUserInfo(){
		HttpServletRequest request = ServletActionContext.getRequest();
		Map session = ActionContext.getContext().getSession();
		UserEntity userEntity = (UserEntity) session.get("user");

		log.debug("修改會員資料");
		log.debug("Model = {}", model);
		model.setModifier("Guest");
		model.setModifiedTime(LocalDateTime.now());
		// log.debug(""+userEntity);
		try {
			if (model != null) {
				userEntity.setUserPassword(model.getUserPassword());
				userEntity.setUserName(model.getUserName());
				userEntity.setUserBirthday(model.getUserBirthday());
				userEntity.setUserEmail(model.getUserEmail());
				userEntity.setUserPhone(model.getUserPhone());
				service.update(userEntity);
				log.debug("!!修改成功!!");
				inputStream = new ByteArrayInputStream("true".getBytes(StandardCharsets.UTF_8));
			}
		} catch (Exception e) {
			log.debug("!!新增錯誤!!");
			inputStream = new ByteArrayInputStream("false".getBytes(StandardCharsets.UTF_8));
			e.printStackTrace();
		}
		return "updateUserInfo";
	}
	
	//更新會員資料
	public String updateUserPassword() throws Exception {
		HttpServletRequest request = ServletActionContext.getRequest();
		Map session = ActionContext.getContext().getSession();
		UserEntity userEntity = (UserEntity) session.get("user");
		//log.debug("updateUserPassword()");
		model.setModifier("Guest");
		model.setModifiedTime(LocalDateTime.now());
		
		if (getFieldErrors().isEmpty()) {
			log.debug("修改會員資料");
			log.debug("Model = {}", model);
			
			// log.debug(""+userEntity);
			try {
				if (userPassword != null && userPassword.length() > 5) {
					model.setUserPassword(oldUserPassword.getBytes());
					model = service.encoding(model);
					if (userEntity != null && Arrays.equals(userEntity.getUserPassword(), model.getUserPassword())) {
						userEntity.setUserPassword(userPassword.getBytes());
						service.update(userEntity);
						service.updateUserPasswordMail(userEntity);
						inputStream = new ByteArrayInputStream("true".getBytes(StandardCharsets.UTF_8));
					} else {
						log.debug("密碼不符合");
						inputStream = new ByteArrayInputStream("false".getBytes(StandardCharsets.UTF_8));
					}
				}
			} catch (Exception e) {
				log.debug("!!新增錯誤!!");
				inputStream = new ByteArrayInputStream("false".getBytes(StandardCharsets.UTF_8));
				e.printStackTrace();
			}
		}
		return "updateUserPassword";
	}

	//身分證重複驗證
	public String checkUserCardId() {
		String result = ERROR;
		String userCardId = model.getUserCardId().toUpperCase();
		//log.debug("檢查身分證是否重複" + userCardId);
		if(service.getByuserCardId(userCardId)==null) {
			result = SUCCESS;
		}else {
			this.addFieldError("userCardId", this.getText("invalid.fieldvalue.cardid"));
		}
		return result;
	}
	public final Pattern TWPID_PATTERN = Pattern.compile("[ABCDEFGHJKLMNPQRSTUVXYWZIO][12]\\d{8}");
	public boolean isValidTWPID(String twpid) {
		boolean result = false;
		String pattern = "ABCDEFGHJKLMNPQRSTUVXYWZIO";
		if (TWPID_PATTERN.matcher(twpid.toUpperCase()).matches()) {
			int code = pattern.indexOf(twpid.toUpperCase().charAt(0)) + 10;
			int sum = 0;
			sum = (int) (code / 10) + 9 * (code % 10) + 8
					* (twpid.charAt(1) - '0') + 7 * (twpid.charAt(2) - '0') + 6
					* (twpid.charAt(3) - '0') + 5 * (twpid.charAt(4) - '0') + 4
					* (twpid.charAt(5) - '0') + 3 * (twpid.charAt(6) - '0') + 2
					* (twpid.charAt(7) - '0') + 1 * (twpid.charAt(8) - '0')
					+ (twpid.charAt(9) - '0');
			if ((sum % 10) == 0) {
				result = true;
			}else {
				this.addFieldError("userCardId", this.getText("invalid.fieldvalue.cardid"));
			}
		}
		return result;
	}
	
	//Email重複驗證
	public String checkEmail() {
		String result = ERROR;
		//log.debug("檢查Email是否存在" + model.getUserEmail());
		Map session = ActionContext.getContext().getSession();
		UserEntity userEntity = (UserEntity)session.get("user");
		if(userEntity!=null && userEntity.getUserEmail().equals(model.getUserEmail())) {
			return SUCCESS;//驗證資料
		}else if (model!=null && model.getUserEmail().length()>0) {
			UserEntity check = service.getByUserEmail(model.getUserEmail());
			if (check == null) {
				result = SUCCESS;
			} else {
				//log.debug("Email已存在");
				addFieldError("mail", "Email已存在");
				result = ERROR;
			}
			return result;
		}
		log.debug("model為空值或email未輸入");
		return result;
	}
	
	//Email重複驗證2 本驗證可允許與自己的Email重複
	public String checkEmailSelf() {
		//log.debug("檢查Email是否存在" + model.getUserEmail());
		Map session = ActionContext.getContext().getSession();
		UserEntity userEntity = (UserEntity)session.get("user");
		if(userEntity!=null && userEntity.getUserEmail().equals(model.getUserEmail())) {
			log.debug("驗證輸入自己的Email");
			inputStream = new ByteArrayInputStream("true".getBytes(StandardCharsets.UTF_8));
		}else if (model!=null && model.getUserEmail().length()>0) {
			UserEntity check = service.getByUserEmail(model.getUserEmail());
			if (check == null) {
				log.debug("驗證輸入不重複的Eamil");
				inputStream = new ByteArrayInputStream("true".getBytes(StandardCharsets.UTF_8));
			} else {
				log.debug("驗證輸入重複的Email");
				inputStream = new ByteArrayInputStream("false".getBytes(StandardCharsets.UTF_8));
			}
		}else{
			log.debug("驗證沒有輸入Email");
			inputStream = new ByteArrayInputStream("false".getBytes(StandardCharsets.UTF_8));
		}
		
		return "checkEmailSelf";
	}
	
	//帳號重複驗證
	public String check() {
		String result = ERROR;
		if (model!=null && model.getUserAccount().length()>5) {
			UserEntity check = service.getByUserAccount(model.getUserAccount());
			if (check == null) {
				result = SUCCESS;
			} else {
				//log.debug("帳號已存在");
				addFieldError("account", "帳號已存在");
			}
		}else {
			this.addFieldError("account", this.getText("invalid.fieldvalue.id"));
		}
		return result;
	}
	

	//登入
	public String login() throws Exception {
		log.debug("login...");
		
		//測試期間用 無法改密碼
		UserEntity entity2 = service.getById(2l);
		entity2.setUserPassword("a123456".getBytes());
		service.update(entity2);
		UserEntity entity3 = service.getById(3l);
		entity3.setUserPassword("a123456".getBytes());
		service.update(entity3);
		
		
		//正式程式碼
		log.debug(model.getUserAccount() + " : " + model.getUserPassword());
		UserEntity entity = service.checkLogin(model.getUserAccount(), model);
		if(entity!=null) {
			Map<String,UserEntity> session = (Map) ServletActionContext.getContext().getSession();
			session.put("user", entity);
			//UserEntity e = session.get("user");
			//log.debug(""+e);
			return SUCCESS;
		} else {
			log.debug("帳號不正確");
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
