package com.mediacaovirtual.dao;

import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;
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
	
	public Post getPost(int id){
		try {
			Session conSession = bd.getConexao();
			String hql = "FROM Post AS post WHERE post.id = ?";
			Query query = conSession.createQuery(hql);
			query.setParameter(0, id);
			Post post;
			if(query.list().isEmpty()) {
				post = null;
			}else {
				post = (Post) query.list().get(0);
			}
			conSession.close();
			return post;
		} catch (HibernateException e) {
			e.printStackTrace();
			return null;
		}
	}
	
	public List<Post> listarPosts(){
		try {
			Session conSession = bd.getConexao();
			String hql = "FROM Post AS post";
			Query query = conSession.createQuery(hql);
			@SuppressWarnings("unchecked")
			List<Post> results = query.list();
			conSession.close();
			return results;
		} catch (HibernateException e) {
			e.printStackTrace();
			return null;
		}
	}
}