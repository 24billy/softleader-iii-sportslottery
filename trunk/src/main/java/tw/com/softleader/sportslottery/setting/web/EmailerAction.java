package tw.com.softleader.sportslottery.setting.web;


import java.util.Properties;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.opensymphony.xwork2.ActionSupport;

public class EmailerAction extends ActionSupport {
	private Logger log = LoggerFactory.getLogger(GameAction.class);

	
	
	
	
	private String host = "smtp.gmail.com";
	private String port = "465";
	
	private String from = "tsubasa1109";
	private String password = "adcis1109";
	private String to;
	private String subject;
	private String body;
	
	static Properties properties = new Properties();
	static {
		System.out.println("初始化Eamilproperites");
		properties.put("mail.smtp.host", "smtp.gmail.com");
		properties.put("mail.smtp.socketFactory.port", "465");
		properties.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
		properties.put("mail.smtp.auth", "true"); properties.put("mail.smtp.port", "465");
	} 
	
	public String execute() { 
		String ret = SUCCESS;
		try { Session session = Session.getDefaultInstance(properties, 
				new javax.mail.Authenticator() { 
					protected PasswordAuthentication getPasswordAuthentication() {
						return new PasswordAuthentication(from, password); 
					}
				}); 
			Message message = new MimeMessage(session);
			message.setFrom(new InternetAddress(from));
			message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(to));
			message.setSubject(subject); message.setText(body); Transport.send(message);
		} catch(Exception e) { 
			ret = ERROR; 
			e.printStackTrace(); 
		} 
		return ret; 
	}

		
		
	



	public String getTo() {
		return to;
	}

	public void setTo(String to) {
		this.to = to;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public String getBody() {
		return body;
	}

	public void setBody(String body) {
		this.body = body;
	}

	// public static Properties getProperties() {
	// return properties;
	// }
	//
	// public static void setProperties(Properties properties) {
	// EmailerAction.properties = properties;
	// }
}
