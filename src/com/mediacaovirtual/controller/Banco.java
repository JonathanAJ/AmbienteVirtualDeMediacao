package com.mediacaovirtual.controller;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.boot.registry.StandardServiceRegistry;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.hibernate.cfg.Configuration;

public class Banco {
	
	public Session getConexao(){
		
		Configuration configuration = new Configuration();
		configuration.configure();
		
		StandardServiceRegistry standardRegistry = new StandardServiceRegistryBuilder()
				.configure("hibernate.cfg.xml")
				.build();
		
		SessionFactory sessionFactory =	configuration.buildSessionFactory(standardRegistry);
		Session session = sessionFactory.openSession();
		
		return session;
	}
}