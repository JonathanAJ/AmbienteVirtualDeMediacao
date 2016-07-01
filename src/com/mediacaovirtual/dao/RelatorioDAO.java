package com.mediacaovirtual.dao;

import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;

import com.mediacaovirtual.controller.Banco;

public class RelatorioDAO {
	
	public List<Object[]> getRelatorioGeral(){
		Session conSession = Banco.getConexao();
		try {
			String hql = "SELECT n.nome, u.nome, c.nome, p.data " +
						 "FROM Categoria AS c, Usuario AS u, Post AS p, Nucleo AS n " +
						 "WHERE p.dono = u.id AND " +
						 "p.categoria = c.id AND " +
						 "u.nucleo = n.id " +
						 "ORDER BY p.data DESC";
			
			Query query = conSession.createQuery(hql);
			@SuppressWarnings("unchecked")
			List<Object[]> results = query.list();
			return results;
		
		} catch (HibernateException e) {
			e.printStackTrace();
			return null;
		
		} finally {
			conSession.close();
		}
	}
	
	public List<Object[]> getRelatorioNucleo(int idNucleo){
		Session conSession = Banco.getConexao();
		try {
			String hql = "SELECT n.nome, u.nome, c.nome, p.data " +
						 "FROM Categoria AS c, Usuario AS u, Post AS p, Nucleo AS n " +
						 "WHERE p.dono = u.id AND " +
						 "p.categoria = c.id AND " +
						 "u.nucleo = n.id AND " +
						 "n.id = ? " +
						 "ORDER BY p.data DESC";
			
			Query query = conSession.createQuery(hql);
			query.setParameter(0, idNucleo);
			@SuppressWarnings("unchecked")
			List<Object[]> results = query.list();
			return results;
		
		} catch (HibernateException e) {
			e.printStackTrace();
			return null;
		
		} finally {
			conSession.close();
		}
	}
	
	public List<Object[]> getRelatorioPessoal(int idUsuario){
		Session conSession = Banco.getConexao();
		try {
			String hql = "SELECT n.nome, u.nome, c.nome, p.data " +
						 "FROM Categoria AS c, Usuario AS u, Post AS p, Nucleo AS n " +
						 "WHERE p.dono = u.id AND " +
						 "p.categoria = c.id AND " +
						 "u.nucleo = n.id AND " +
						 "u.id = ? " +
						 "ORDER BY p.data DESC";
			
			Query query = conSession.createQuery(hql);
			query.setParameter(0, idUsuario);
			@SuppressWarnings("unchecked")
			List<Object[]> results = query.list();
			return results;
		
		} catch (HibernateException e) {
			e.printStackTrace();
			return null;
		
		} finally {
			conSession.close();
		}
	}

}
