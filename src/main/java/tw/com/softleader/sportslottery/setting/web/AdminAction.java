package tw.com.softleader.sportslottery.setting.web;

import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;

import tw.com.softleader.sportslottery.setting.service.GameService;

import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class AdminAction extends ActionSupport {
	private static final long serialVersionUID = 2014L;
	@Autowired
	private GameService gameService;
	private Locale locale = ActionContext.getContext().getLocale();
	private Long maxGameNum;
	
	public Locale getLocale() {
		return locale;
	}
	
	public Long getMaxGameNum() {
		return maxGameNum;
	}
	
	public String execute() {
		maxGameNum = gameService.maxGameNum();
		return Action.SUCCESS;
	}
}
