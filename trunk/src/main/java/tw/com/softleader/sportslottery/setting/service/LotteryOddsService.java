package tw.com.softleader.sportslottery.setting.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tw.com.softleader.sportslottery.common.dao.GenericDao;
import tw.com.softleader.sportslottery.common.service.GenericService;
import tw.com.softleader.sportslottery.setting.dao.LotteryOddsDao;
import tw.com.softleader.sportslottery.setting.entity.LotteryOddsEntity;

@Service
public class LotteryOddsService extends GenericService<LotteryOddsEntity> {
	
	@Autowired
	private LotteryOddsDao dao;
	
	public GenericDao<LotteryOddsEntity> getDao() {
		return dao;
	}
	
	public List<LotteryOddsEntity> getByLotteryId(Long lotteryId) {
		return dao.findByLotteryId(lotteryId);
	}
	
	public List<LotteryOddsEntity> getByOddsId(Long oddsId) {
		return dao.findByOddsId(oddsId);
	}
	
	public List<LotteryOddsEntity> getPassedOdds() {
		return dao.findPassedOdds();
	}
	
	public List<LotteryOddsEntity> getPassedOddsByLotteryId(Long lotteryId) {
		return dao.findPassedOddsByLotteryId(lotteryId);
	}
	
}
