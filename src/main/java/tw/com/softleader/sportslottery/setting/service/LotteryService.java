package tw.com.softleader.sportslottery.setting.service;

import java.util.List;

import org.joda.time.LocalDate;
import org.joda.time.LocalDateTime;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tw.com.softleader.sportslottery.common.dao.GenericDao;
import tw.com.softleader.sportslottery.common.service.GenericService;
import tw.com.softleader.sportslottery.setting.dao.GameDao;
import tw.com.softleader.sportslottery.setting.dao.LotteryDao;
import tw.com.softleader.sportslottery.setting.dao.LotteryOddsDao;
import tw.com.softleader.sportslottery.setting.entity.LotteryEntity;

/**
@Author:Billy 
 */

@Service
public class LotteryService extends GenericService<LotteryEntity> {
	
	@Autowired
	private LotteryDao dao;
	
	@Autowired
	private LotteryOddsDao lotteryOddsDao;
	
	@Autowired
	private GameDao gameDao;
	
	@Override
	protected GenericDao<LotteryEntity> getDao() {
		// TODO Auto-generated method stub
		return dao;
	}
	
	public List<LotteryEntity> getByUserId(Long userId) {
		return dao.findByUserId(userId);
	}
	
	public List<LotteryEntity> getByTime(LocalDateTime timeBegin, LocalDateTime timeEnd) {
		return dao.findByTime(timeBegin, timeEnd);
	}
	
	public List<LotteryEntity> getComplex(Long userId, LocalDate timeBegin, LocalDate timeEnd) {
		return dao.findComplex(userId, timeBegin, timeEnd);
	}
}
