package tw.com.softleader.sportslottery.setting.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.joda.time.LocalDate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import tw.com.softleader.sportslottery.common.dao.GenericDao;
import tw.com.softleader.sportslottery.common.service.GenericService;
import tw.com.softleader.sportslottery.setting.dao.GameDao;
import tw.com.softleader.sportslottery.setting.dao.LotteryDao;
import tw.com.softleader.sportslottery.setting.dao.LotteryOddsDao;
import tw.com.softleader.sportslottery.setting.dao.OddsDao;

import tw.com.softleader.sportslottery.setting.entity.OddsEntity;

import com.google.gson.Gson;

/**
 * 
 * @author ebikyatto
 *
 */

@Service
public class OddsService extends GenericService<OddsEntity> {
	
	@Autowired
	private OddsDao dao;
	
	@Autowired
	private LotteryOddsDao lotteryOddsDao;
	
	@Autowired
	private LotteryDao lotteryDao;
	
	@Override
	protected GenericDao<OddsEntity> getDao() {
		return dao;
	}
	
	public List<OddsEntity> getByOddType(String oddType) {
		return dao.findByOddType(oddType);
	}
	
	public String getByOddTypeJson(String oddType) {
		String toJson = new Gson().toJson(dao.findByOddType(oddType));
		return toJson;
	}
	
	public List<OddsEntity> getByGameId(Long gameId) {
		return dao.findByGameId(gameId);
	}
	
	public String getByGameIdJson(Long gameId) {
		String toJson = new Gson().toJson(dao.findByGameId(gameId));
		return toJson;
	}
	
	public Double getOddValue(Long gameId, String oddType) {
		
		Double oddValue = null;
		List<OddsEntity> list = dao.findByGameId(gameId);
				
		if (list != null) {
			for (OddsEntity odds : list) {
				if (odds.getOddType().equals(oddType)) {
					oddValue = odds.getOddValue().doubleValue();
				}
			}
		}
		return oddValue;
	}
	
	public boolean setIsPass(Long gameId, String su, String ats, String sc, String eo) {
		OddsEntity entity = null;
		
		try {
			List<OddsEntity> entitys = dao.findByGameId(gameId);
			
			for (OddsEntity odds : entitys) {
				odds.setIsPass(false);
				dao.update(odds);
			}
			
			if (!StringUtils.isEmpty(su)) {
				entity = dao.findByGameIdWithOddType(gameId, su).get(0);
				entity.setIsPass(true);
				dao.update(entity);
			}
			if (!StringUtils.isEmpty(ats)) {
				entity = dao.findByGameIdWithOddType(gameId, ats).get(0);
				entity.setIsPass(true);
				dao.update(entity);
			}
			if (!StringUtils.isEmpty(sc)) {
				entity = dao.findByGameIdWithOddType(gameId, sc).get(0);
				entity.setIsPass(true);
				dao.update(entity);
			}
			if (!StringUtils.isEmpty(eo)) {
				entity = dao.findByGameIdWithOddType(gameId, eo).get(0);
				entity.setIsPass(true);
				dao.update(entity);
			}
			
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}
	
	public List<OddsEntity> getByGameIdWithOddType(Long gameId, String oddType) {
		return dao.findByGameIdWithOddType(gameId, oddType);
	}
	
	public Long countByOddType(String oddType){
		return dao.countByOddType(oddType);
	}
	
	//將OddsList 變成 Map
	public Map<String, OddCountBean> from_OddsEntityList_To_OddsEntityMap(String teamName , LocalDate gameTime){
		Map<String,OddCountBean> map=new HashMap<String,OddCountBean>();

//		Long totalCount=getTotalCountOftheDay(OddsList);
		
		
//		for(OddsEntity odd: OddsList ){
//			OddCountBean bean= new OddCountBean();
//			bean.setCount(odd.getCount());
//			bean.setTotalCountOftheDay(totalCount);
//			bean.setCountPercentage(bean.getCount(), totalCount);
//			bean.setGameTime(gameTime);
//			bean.setIsPass(odd.getIsPass());
			//bean.setTeamName();
		
			
//			
//			if(odd.getOddType().equals("SU_H")){
//				bean.setOddType("SU_H");
//				map.put("SU_H", bean);
//				
//				
//			}else if(odd.getOddType().equals("SU_A")){
//				bean.setOddType("SU_A");
//				map.put("SU_A", bean);
//				
//				
//			}else if(odd.getOddType().equals("ATS_A")){
//				bean.setOddType("ATS_A");
//				map.put("ATS_A", bean);
//				
//				
//			}else if(odd.getOddType().equals("ATS_H")){
//				bean.setOddType("ATS_H");
//				map.put("ATS_H", bean);
//				
//				
//			}else if(odd.getOddType().equals("SC_H")){
//				bean.setOddType("SC_H");
//				map.put("SC_H", bean);
//				
//				
//			}else if(odd.getOddType().equals("SC_L")){
//				bean.setOddType("SC_L");
//				map.put("SC_L", bean);
//				
//				
//			}else if(odd.getOddType().equals("ODD")){
//				bean.setOddType("ODD");
//				map.put("ODD", bean);
//				
//				
//			}else if(odd.getOddType().equals("EVEN")){
//				bean.setOddType("EVEN");
//				map.put("EVEN", bean);
//			
//				
//			}
//		}
		
		return map;
	}

	private Long getTotalCountOftheDay(List<OddsEntity> oddsList) {
		
		return null;
	}
	
	

	
	
	
}

