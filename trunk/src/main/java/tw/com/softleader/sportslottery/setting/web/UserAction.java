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
	private String userPassword;
	private String confirm_password;
	

	private List<UserEntity> models;
	private Logger log = LoggerFactory.getLogger(UserAction.class);
	private String json;
	private InputStream inputStream;
	private LocalDate time;
	private String from = "sportslott123";
	private String password = "forget123";
	private String to;
	private String account;
	private String cardAccount;
	private Long coins;		//把值送進coins讓使用者coins更新
	
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
	
	//會員儲值下注得獎coins修改
	public String coinsUpdate() {
		
		Map session = ActionContext.getContext().getSession();
		UserEntity user = (UserEntity)session.get("user");
		//log.debug(""+user);
		//儲值
		DepositCardEntity card = cardService.findByCardAccount(cardAccount,cardPassword);
		if(card!=null) {
			try {
				user.setCoins(user.getCoins() + card.getPoint());
				
				if (card.isState()) {
					service.update(user);
					log.debug("儲值成功");
					card.setState(false);
					cardService.update(card);
					return SUCCESS;
				} else {
					log.debug("此卡已使用");
					this.addFieldError("cardError", this.getText("alreadyuse.card"));
					return ERROR;
				}
			} catch (Exception e) {
				log.debug("coins修改異常");
				this.addFieldError("cardError", this.getText("fieldvalue.card"));
				e.printStackTrace();
			}
		} else {
			log.debug("查無此點數卡");
			this.addFieldError("cardError", this.getText("fieldvalue.card"));
			return ERROR;
		}
		
		
		//別的更改coins方式
		log.debug("coins修改非常異常");
		return ERROR;
	}
	
	//忘記密碼 寄送新密碼到使用者email
	static Properties properties = new Properties();
	static {
		System.out.println("初始化Eamil-Properites");
		properties.put("mail.smtp.host", "smtp.gmail.com");
		properties.put("mail.smtp.socketFactory.port", "465");
		properties.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
		properties.put("mail.smtp.auth", "true"); properties.put("mail.smtp.port", "465");
	}
	public String forgetPassword() {
		log.debug(to + " : " + account);
		String ret = SUCCESS;
		String body=null;
		UserEntity userEntity = service.getByUserAccount(account);
		if(userEntity!=null) {
			if(userEntity.getUserEmail().equals(to)) {
				byte[] newPassword = service.getNewPassword();
				
				userEntity.setUserPassword(newPassword);
				service.update(userEntity);
				body = "您的密碼暫為:" + new String(new String(newPassword)); 
			}else {
				log.debug("Email不正確");
				this.addFieldError("emailCheck", this.getText("invalid.fieldvalue.forget.email"));
			}
		}else {
			log.debug("帳號不正確");
			this.addFieldError("accountCheck", this.getText("invalid.fieldvalue.forget.account"));
		}
		
		try { Session session = Session.getDefaultInstance(properties, 
				new javax.mail.Authenticator() { 
					protected PasswordAuthentication getPasswordAuthentication() {
						return new PasswordAuthentication(from, password); 
					}
				}); 
			Message message = new MimeMessage(session);
			message.setFrom(new InternetAddress(from));
			message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(to));
			message.setSubject("您的密碼來了,請盡快更改");
			message.setText(body);
			Transport.send(message);
		} catch(Exception e) { 
			ret = ERROR; 
			//e.printStackTrace(); 
		} 
		return ret; 
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
		if(this.getFieldErrors().isEmpty()){
			model.setCreator("Guest"); //變數
			model.setModifier("Guest"); //變數
			model.setCreateTime(LocalDateTime.now());
			model.setModifiedTime(LocalDateTime.now());
			//model.setUserPassword(userPassword.getBytes());
			log.debug("Model = {}", model);
			
			try {
				service.insert(model);
			} catch (Exception e) {
				log.debug("!!新增錯誤!!");
				this.addFieldError("other", this.getText("invalid.fieldvalue.other"));
				e.printStackTrace();
				return INPUT;
			}
			return SUCCESS;
		}
		log.debug("有誤");
		return INPUT;
	}
	
	//更新會員資料
	public String update() throws Exception {
		log.debug("修改會員資料");
		log.debug("Model = {}", model);
		model.setModifier("Guest");
		model.setModifiedTime(LocalDateTime.now());
		HttpServletRequest request = ServletActionContext.getRequest();
		Map session = ActionContext.getContext().getSession();
		UserEntity userEntity = (UserEntity)session.get("user");
		//log.debug(""+userEntity);
		try {
			if (model!=null) {
				log.debug("密碼:" + userPassword);
				userEntity.setUserName(model.getUserName());
				userEntity.setUserBirthday(model.getUserBirthday());
				userEntity.setUserEmail(model.getUserEmail());
				userEntity.setUserPhone(model.getUserPhone());
				model.setUserPassword(userPassword.getBytes());
				userEntity.setUserPassword(model.getUserPassword());
				userEntity.setUserGender(model.getUserGender());
				
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
	
	//帳號重複驗證
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
	
	//登入
	public String login() throws Exception {
		log.debug("login...");

		//測試期間用 無法改密碼
		UserEntity entity2 = service.getById(2l);
		log.debug(entity2.toString());
		entity2.setUserPassword("a123456".getBytes());
		service.update(entity2);
		
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
