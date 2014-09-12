package tw.com.softleader.sportslottery.setting.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tw.com.softleader.sportslottery.common.dao.GenericDao;
import tw.com.softleader.sportslottery.common.service.GenericService;
import tw.com.softleader.sportslottery.setting.dao.AdminLogDao;
import tw.com.softleader.sportslottery.setting.entity.AdminLogEntity;

@Service
public class AdminLogService extends GenericService<AdminLogEntity> {

	@Autowired
	private AdminLogDao dao;
	
	@Override
	protected GenericDao<AdminLogEntity> getDao() {
		return dao;
	}
	
	public List<AdminLogEntity> getInLastMonth() {
		return dao.findInLastMonth();
	}
	
	public List<AdminLogEntity> getInLastThreeMonths() {
		return dao.findInLastThreeMonths();
	}
	
	public List<AdminLogEntity> getInLastSixMonths() {
		return dao.findInLastSixMonths();
	}
	
	public List<AdminLogEntity> getInLastYear() {
		return dao.findInLastYear();
	}
	
	public Long getSumFromTodayToSpecificMonth(int arg0) {
		return dao.findSumFromTodayToSpecificMonth(arg0);
	}
	
	public List<Long> getSumOfLastYear() {
		List<Long> sums = new ArrayList<Long>();
		for (int arg = -1; arg >= -12; arg--) {
			sums.add(dao.findSumFromTodayToSpecificMonth(arg));
		}
		return sums;
	}
}
