package com.mediacaovirtual.dao;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.mediacaovirtual.controller.Banco;
import com.mediacaovirtual.model.Post;

public class PostDAO {
	
	private Banco bd = new Banco();
	
	public boolean createPost(Post post){
		try {
			Session conSession = bd.getConexao();
			Transaction tx = conSession.beginTransaction();
			conSession.save(post);
			tx.commit();
			conSession.close();
			return true;
		} catch (HibernateException e) {
			e.printStackTrace();
			return false;
		}
	}
}