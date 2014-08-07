package tw.com.softleader.sportslottery.common.service;

import java.util.List;

import com.google.gson.Gson;

import tw.com.softleader.sportslottery.common.dao.GenericDao;
import tw.com.softleader.sportslottery.common.entity.GenericEntity;

public abstract class GenericService<T extends GenericEntity> {

	protected abstract GenericDao<T> getDao();

	public List<T> getAll() {
		return getDao().findAll();
	}
	
	public T getById(Long id) {
		return getDao().findById(id);
	}
	
	public T insert(T entity) {
		getDao().insert(entity);
		return entity;
	}
	
	public T update(T entity) {
		getDao().update(entity);
		return entity;
	}
	
	public void delete(T entity) {
		getDao().delete(entity);
	}
	
	public String getAllJSON() {
		String toJson = new Gson().toJson(getDao().findAll());
		return toJson;
	}
	
	
	
	
}
