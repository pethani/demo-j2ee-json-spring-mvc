package com.plasmid.DAO;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.plasmid.table.Login;

@Repository
@SuppressWarnings({ "unchecked", "rawtypes" })
public class LoginDAO {
	@Autowired
	private SessionFactory sessionFactory;

	/**
	 * @Transactional annotation below will trigger Spring Hibernate transaction
	 *                manager to automatically create a hibernate session. See
	 *                src/main/webapp/WEB-INF/servlet-context.xml
	 */
	@Transactional
	public List<Login> findAll() {
		Session session = sessionFactory.getCurrentSession();
		List data = session.createQuery("from Login").list();
		return data;
	}
	
	@Transactional
	public void Delete(Login type) {
		Session session = sessionFactory.getCurrentSession();
		session.delete(type);
	}
	
	@Transactional
	public void changePass(String uname, String newpass) {
		Session session = sessionFactory.getCurrentSession();
		Login u = (Login) session.get(Login.class, uname);
		u.setPassword(newpass);
		session.save(u);
	}
	
	@Transactional
	public void addUser(Login type) {
		Session session = sessionFactory.getCurrentSession();
		session.save(type);
	}
	
	@Transactional
	public List<Login> getUser(String user) {
		Session session = sessionFactory.getCurrentSession();
		org.hibernate.Query query=session.createQuery("FROM Login P WHERE P.username=:ex");
		query.setParameter("ex", user);
		List data = query.list();
		return data;
	}
}
