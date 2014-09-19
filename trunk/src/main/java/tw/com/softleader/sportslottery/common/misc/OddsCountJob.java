package tw.com.softleader.sportslottery.common.misc;

import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.quartz.QuartzJobBean;

import tw.com.softleader.sportslottery.setting.service.OddsService;

public class OddsCountJob extends QuartzJobBean {
	
	@Autowired
	private OddsService service;
	
	@Override
	protected void executeInternal(JobExecutionContext arg0)
			throws JobExecutionException {
		service.countOddsOnComing();
	}

}
