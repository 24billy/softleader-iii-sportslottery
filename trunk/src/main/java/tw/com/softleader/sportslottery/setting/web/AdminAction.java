package tw.com.softleader.sportslottery.setting.web;

import java.util.Locale;

import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class AdminAction extends ActionSupport {
	private static final long serialVersionUID = 2014L;
	private Locale locale = ActionContext.getContext().getLocale();
	
	public Locale getLocale() {
		return locale;
	}

	public String execute() {
		return Action.SUCCESS;
	}
}
