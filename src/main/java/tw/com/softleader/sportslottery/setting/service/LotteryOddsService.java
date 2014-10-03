package tw.com.softleader.sportslottery.setting.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tw.com.softleader.sportslottery.common.dao.GenericDao;
import tw.com.softleader.sportslottery.common.service.GenericService;
import tw.com.softleader.sportslottery.setting.dao.LotteryOddsDao;
import tw.com.softleader.sportslottery.setting.entity.GameEntity;
import tw.com.softleader.sportslottery.setting.entity.LotteryEntity;
import tw.com.softleader.sportslottery.setting.entity.LotteryOddsEntity;
import tw.com.softleader.sportslottery.setting.entity.OddsEntity;

@Service
public class LotteryOddsService extends GenericService<LotteryOddsEntity> {
	
	@Autowired
	private LotteryOddsDao dao;
	
	@Autowired
	private LotteryService lotteryService;
	
	@Autowired
	private OddsService oddsService;
	@Autowired
	private GameService gameService;
	
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
	
	//中間沒出錯得true
	public Boolean checkStatus(List<LotteryOddsEntity> los) {
		try {
			for (LotteryOddsEntity lo : los) {
				LotteryEntity lottery = lotteryService.getById(lo.getLotteryId());
				lotteryService.calculatePrize(lottery);
			}
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}
	
	public Long countLotterysByOddsId(OddsEntity odds) {
		return dao.countLotterysByOddsId(odds);
	}
	
	public Boolean countAllOddsOfGame() {
		List<GameEntity> games = gameService.getAll();
		try {
		for (GameEntity game : games) {
				List<OddsEntity> odds = game.getOdds();
				for (OddsEntity odd : odds) {
					Long count = countLotterysByOddsId(odd);
					odd.setCount(count);
					oddsService.update(odd);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}
}
