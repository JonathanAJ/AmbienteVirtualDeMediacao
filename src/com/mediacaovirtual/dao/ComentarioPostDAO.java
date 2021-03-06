package com.mediacaovirtual.dao;

import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.mediacaovirtual.controller.Banco;
import com.mediacaovirtual.model.ComentarioPost;

public class ComentarioPostDAO {
	
	public boolean createComentario(ComentarioPost comentario){
		Session conSession = Banco.getConexao();
		try {
			Transaction tx = conSession.beginTransaction();
			conSession.save(comentario);
			tx.commit();
			return true;
			
		} catch (HibernateException e) {
			e.printStackTrace();
			return false;
			
		} finally {
			conSession.close();
		}
	}
	
	public boolean deleteComentario(int idComentario){
		Session conSession = Banco.getConexao();
		try {
			String hql = "DELETE FROM ComentarioPost AS cp WHERE cp.id = ?";
			Query query = conSession.createQuery(hql);
			query.setParameter(0, idComentario);
			query.executeUpdate();
			return true;
			
		} catch (HibernateException e) {
			e.printStackTrace();
			return false;
			
		} finally {
			conSession.close();
		}
	}
	
	public boolean verificaComentario(int idComentario, int idUsuario){
		Session conSession = Banco.getConexao();
		try {
			String hql =  "FROM " + 
						    "ComentarioPost AS cp, " +
						    "Usuario AS u " +
						  "WHERE " +
						    "cp.dono.id = u.id AND " +
						    "cp.id = ? AND " +
						    "u.id = ?";
			
			Query query = conSession.createQuery(hql);
			query.setParameter(0, idComentario);
			query.setParameter(1, idUsuario);
			if(query.uniqueResult() == null){
				return false;
			}
			else{
				return true;
			}
			
		} catch (HibernateException e) {
			e.printStackTrace();
			return false;
			
		} finally {
			conSession.close();
		}
	}
	
	public List<ComentarioPost> getComentarioPost(int id){
		Session conSession = Banco.getConexao();
		try {
			String hql = "FROM ComentarioPost AS coment WHERE coment.post.id = ? ORDER BY coment.data ASC";
			Query query = conSession.createQuery(hql);
			query.setParameter(0, id);
			@SuppressWarnings("unchecked")
			List<ComentarioPost> results = (List<ComentarioPost>) query.list();
			return results;
			
		} catch (HibernateException e) {
			e.printStackTrace();
			return null;
			
		} finally {
			conSession.close();
		}
	}
	
	public Long getNumComentarios(int idPost){
		Session conSession = Banco.getConexao();
		try {
			String hql = "SELECT COUNT(coment.id) FROM ComentarioPost AS coment WHERE coment.post.id = ?";
			Query query = conSession.createQuery(hql);
			query.setParameter(0, idPost);
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
