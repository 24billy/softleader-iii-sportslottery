package tw.com.softleader.sportslottery.common.misc;

import javax.servlet.ServletContext;

import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.quartz.QuartzJobBean;
import org.springframework.web.context.support.SpringBeanAutowiringSupport;

import tw.com.softleader.sportslottery.setting.service.OddsService;

public class OddsCountJob extends QuartzJobBean {
	
	@Autowired
	private OddsService service;
	
	@Override
	protected void executeInternal(JobExecutionContext context)
			throws JobExecutionException {
		SpringBeanAutowiringSupport.processInjectionBasedOnCurrentContext(this);
		service.countOddsOnComing();
		ServletContext servletContext = (ServletContext) context.getJobDetail().getJobDataMap().get("servletContext");
		servletContext.setAttribute("job", "TEST!!!!!");
	}

}
