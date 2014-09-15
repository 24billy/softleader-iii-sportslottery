package tw.com.softleader.sportslottery.setting.web;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import tw.com.softleader.sportslottery.setting.service.ReportService;

import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionSupport;

public class ReportAction extends ActionSupport {
	private static final long serialVersionUID = 2014L;
	private Logger log = LoggerFactory.getLogger(ReportAction.class);
	
	@Autowired
	private ReportService service;
	
	public String select() {
		log.debug("ReportAction select()");
		return Action.SUCCESS;
	}
	
	public String insert() {
		log.debug("ReportAction insert()");
		return Action.SUCCESS;
	}
	
	public String update() {
		log.debug("ReportAction update()");
		return Action.SUCCESS;
	}
	
	public String delete() {
		log.debug("ReportAction delete()");
		return Action.SUCCESS;
	}
	
	public String execute() {
		log.debug("ReportAction execute()");
		return Action.SUCCESS;
	}
	
}
