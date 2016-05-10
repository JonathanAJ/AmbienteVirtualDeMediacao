package com.mediacaovirtual.dao;

import java.util.ArrayList;
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
		Session conSession = bd.getConexao();
		try {
			Transaction tx = conSession.beginTransaction();
			conSession.save(post);
			tx.commit();
			return true;
			
		} catch (HibernateException e) {
			e.printStackTrace();
			return false;
			
		} finally {
			conSession.close();
		}
	}
	
	public Post getPost(int id){
		Session conSession = bd.getConexao();
		try {
			String hql = "FROM Post AS post WHERE post.id = ?";
			Query query = conSession.createQuery(hql);
			query.setParameter(0, id);
			Post post;
			if(query.list().isEmpty()) {
				post = null;
			}else {
				post = (Post) query.list().get(0);
			}
			return post;
			
		} catch (HibernateException e) {
			e.printStackTrace();
			return null;
			
		} finally {
			conSession.close();
		}
	}
	
	public List<Post> listarPosts(){
		Session conSession = bd.getConexao();
		try {
			String hql = "FROM Post AS post";
			Query query = conSession.createQuery(hql);
			@SuppressWarnings("unchecked")
			List<Post> results = query.list();
			return results;
		
		} catch (HibernateException e) {
			e.printStackTrace();
			return null;
		
		} finally {
			conSession.close();
		}
	}
	
	public List<Long> getNumPost(){
		Session conSession = null;
		try {
			List<Long> lista = new ArrayList<Long>();
			for(int i=1; i<=9; i ++){
				conSession = bd.getConexao();
				String hql = "SELECT COUNT(post.id) FROM Post AS post WHERE post.categoria.id = " + i;
				Query query = conSession.createQuery(hql);
				lista.add((Long) query.uniqueResult());
			}
			return lista;
			
		} catch (HibernateException e) {
			e.printStackTrace();
			return null;
			
		} finally {
			conSession.close();
		}
	}
	
	public Long getNumPost(int idCategoria){
		Session conSession = bd.getConexao();
		try {
			String hql = "SELECT COUNT(post.id) FROM Post AS post WHERE post.categoria.id = ?";
			Query query = conSession.createQuery(hql);
			query.setParameter(0, idCategoria);
			Long result = (Long) query.uniqueResult();
			return result;
			
		} catch (HibernateException e) {
			e.printStackTrace();
			return null;
			
		} finally {
			conSession.close();
		}
	}
}