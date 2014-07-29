package tw.com.softleader.sportslottery.common.dao;

import java.lang.reflect.ParameterizedType;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;

import tw.com.softleader.sportslottery.common.entity.GenericEntity;

public class GenericDao<T extends GenericEntity> {

	private Class<T> entityClass;
	
	@Autowired
	private SessionFactory sessionFactory;
	
	public GenericDao() {
		this.entityClass = (Class<T>) ((ParameterizedType) getClass().getGenericSuperclass()).getActualTypeArguments()[0];
	}
	
	public List<T> findAll(){
		Session session = sessionFactory.getCurrentSession();
		List<T> models = session.createCriteria(entityClass).list();
		return models;
	}
	
	public T findById(Long id){
		Session session = sessionFactory.getCurrentSession();
		T model = (T)session.get(entityClass, id);
		return model;
	}
	
	public void insert(T entity){
		Session session = sessionFactory.getCurrentSession();
		session.persist(entity);
	}

	public void update(T entity){
		Session session = sessionFactory.getCurrentSession();
		session.merge(entity);
	}
	
	public void delete(T entity){
		Session session = sessionFactory.getCurrentSession();
		session.delete(entity);
	}
	
}
