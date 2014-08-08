package tw.com.softleader.sportslottery.setting.service;

import java.util.List;

import javax.ws.rs.Consumes;
import javax.ws.rs.DELETE;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.PUT;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tw.com.softleader.sportslottery.common.dao.GenericDao;
import tw.com.softleader.sportslottery.common.service.GenericService;
import tw.com.softleader.sportslottery.setting.dao.OddsDao;
import tw.com.softleader.sportslottery.setting.entity.OddsEntity;

@Service
public class OddsService extends GenericService<OddsEntity> {
	
	@Autowired
	private SessionFactory sessionFactory;
	
	@Autowired
	private OddsDao dao;
	
	@Override
	protected GenericDao<OddsEntity> getDao() {
		return dao;
	
	}
	
	@Override
	public List<OddsEntity> getAll() {
		// TODO Auto-generated method stub
		return super.getAll();
	}
	
	@Override
	public OddsEntity getById(Long id) {
		// TODO Auto-generated method stub
		return super.getById(id);
	}
	
	@Override
	public OddsEntity insert(OddsEntity entity) {
		// TODO Auto-generated method stub
		return super.insert(entity);
	}

	@Override
	public OddsEntity update(OddsEntity entity) {
		// TODO Auto-generated method stub
		return super.update(entity);
	}
	
	@Override
	public void delete(OddsEntity entity) {
		// TODO Auto-generated method stub
		super.delete(entity);
	}
}
