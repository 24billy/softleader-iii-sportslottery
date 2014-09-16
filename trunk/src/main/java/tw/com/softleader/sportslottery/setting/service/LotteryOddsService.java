package tw.com.softleader.sportslottery.setting.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tw.com.softleader.sportslottery.common.dao.GenericDao;
import tw.com.softleader.sportslottery.common.service.GenericService;
import tw.com.softleader.sportslottery.setting.dao.LotteryOddsDao;
import tw.com.softleader.sportslottery.setting.entity.LotteryEntity;
import tw.com.softleader.sportslottery.setting.entity.LotteryOddsEntity;

@Service
public class LotteryOddsService extends GenericService<LotteryOddsEntity> {
	
	@Autowired
	private LotteryOddsDao dao;
	
	@Autowired
	private LotteryService lotteryService;
	
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
	
	public boolean checkStatus(List<LotteryOddsEntity> los) {
		for (LotteryOddsEntity lo : los) {
			
			LotteryEntity lottery = lotteryService.getById(lo.getLotteryId());
			lotteryService.calculatePrize(lottery);
			/*
			if (lottery.getWin() == null) {
				List<LotteryOddsEntity> entitys = dao.findByLotteryId(lottery.getId());
				List<LotteryOddsEntity> passed = dao.findPassedOddsByLotteryId(lottery.getId());
				
				if (entitys.size() == passed.size()) {
					BigDecimal value = new BigDecimal(1);
					
					for (LotteryOddsEntity entity : entitys) {
						value = value.multiply(entity.getOddsId().getOddValue());
					}
					BigDecimal capital = new BigDecimal(lottery.getCapital());
					lottery.setWin(value.multiply(capital).longValue());
					lotteryDao.update(lottery);
				} else {
					lottery.setWin(0L);
					lotteryDao.update(lottery);
				}
			}
			*/
		}
		return true;
	}
	
}
