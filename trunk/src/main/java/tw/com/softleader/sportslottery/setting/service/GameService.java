package tw.com.softleader.sportslottery.setting.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tw.com.softleader.sportslottery.common.dao.GenericDao;
import tw.com.softleader.sportslottery.common.service.GenericService;
import tw.com.softleader.sportslottery.setting.dao.GameDao;
import tw.com.softleader.sportslottery.setting.entity.GameEntity;

/**
 * 
 * @author nick
 *
 */
@Service
public class GameService extends GenericService<GameEntity> {
	@Autowired
	private GameDao dao;

	@Override
	protected GenericDao<GameEntity> getDao() {
		
		return dao;
	}
	
	@Override
	public List<GameEntity> getAll() {
		// TODO Auto-generated method stub
		return super.getAll();
	}

	@Override
	public GameEntity getById(Long id) {
		// TODO Auto-generated method stub
		return super.getById(id);
	}

	@Override
	public GameEntity insert(GameEntity entity) {
		// TODO Auto-generated method stub
		return super.insert(entity);
	}

	@Override
	public GameEntity update(GameEntity entity) {
		// TODO Auto-generated method stub
		return super.update(entity);
	}

	@Override
	public void delete(GameEntity entity) {
		// TODO Auto-generated method stub
		super.delete(entity);
	}

}
