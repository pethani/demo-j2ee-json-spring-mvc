package com.plasmid.DAO;

import java.util.List;



import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.plasmid.table.Login;
import com.plasmid.table.Plasmidsdetail;

@Repository
@SuppressWarnings({ "unchecked", "rawtypes" })
public class PlasmidsdetailDAO {

	@Autowired
	private SessionFactory sessionFactory;

	@Transactional
	public void addPlasmid(Plasmidsdetail pla) {
		Session session = sessionFactory.getCurrentSession();
		session.save(pla);
	}

	@Transactional
	public void Delete(int n) {
		Session session = sessionFactory.getCurrentSession();
		org.hibernate.Query query = session
				.createQuery("delete Plasmidsdetail P WHERE P.nr=:ex");
		query.setParameter("ex", n);
		query.executeUpdate();
	}

	@Transactional
	public List<Plasmidsdetail> getSpecific(int n) {
		Session session = sessionFactory.getCurrentSession();
		org.hibernate.Query query = session
				.createQuery("FROM Plasmidsdetail P WHERE P.nr=:ex");
		query.setParameter("ex",n);
		List data = query.list();
		return data;
	}
	
	@Transactional
	public List<Plasmidsdetail> getByname(String name) {
		Session session = sessionFactory.getCurrentSession();
		org.hibernate.Query query = session
				.createQuery("FROM Plasmidsdetail P WHERE P.experimentor=:ex");
		query.setParameter("ex",name);
		List data = query.list();
		return data;
	}

	@Transactional
	public List<Plasmidsdetail> getAll() {
		Session session = sessionFactory.getCurrentSession();
		org.hibernate.Query query = session.createQuery("FROM Plasmidsdetail");
		List data = query.list();
		return data;
	}
	
	@Transactional
	public void changeMap(int nr) {
		Session session = sessionFactory.getCurrentSession();
		org.hibernate.Query query = session
				.createQuery("update Plasmidsdetail P set P.map = :temp where P.nr = :ex");
		query.setParameter("ex", nr);
		query.setParameter("temp", "Available");
		query.executeUpdate();
	}
	
	@Transactional
	public void changeBoxnr(int nr,int boxnr) {
		Session session = sessionFactory.getCurrentSession();
		org.hibernate.Query query = session
				.createQuery("update Plasmidsdetail P set P.boxnr = :temp where P.nr = :ex");
		query.setParameter("ex", nr);
		query.setParameter("temp", boxnr);
		query.executeUpdate();
	}
}
