package com.mediacaovirtual.dao;

import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.mediacaovirtual.controller.Banco;
import com.mediacaovirtual.model.Usuario;

public class UsuarioDAO {
	
	private Banco bd = new Banco();
	
	public boolean createUsuario(Usuario usuario){
		try{
			Usuario usuarioTmp = getUsuario(usuario.getCpfLogin());
			if(usuarioTmp == null){
				Session conSession = bd.getConexao();
				Transaction tx = conSession.beginTransaction();
				conSession.save(usuario);
				tx.commit();
				conSession.close();
				return true;
			}else{
				return false;
			}
		} catch (HibernateException e) {
			e.printStackTrace();
			return false;
		}
	}
	
	public Usuario getUsuario(String cpflogin, String senha){
		try {
			Session conSession = bd.getConexao();
			String hql = "FROM Usuario AS usuario " +
						   "WHERE usuario.cpfLogin = ? AND usuario.senha = ?";
			Query query = conSession.createQuery(hql);
			query.setParameter(0, cpflogin);
			query.setParameter(1, senha);
			List<?> results = query.list();
			Usuario usuario = new Usuario();
			if(query.list().isEmpty()) {
				usuario = null;
			}else {
				usuario = (Usuario) results.get(0);	
			}
			conSession.close();
			return usuario;
		} catch(HibernateException e){
			e.printStackTrace();
			return null;
		}
	}

	public Usuario getUsuario(String cpflogin){
		try {
			Session conSession = bd.getConexao();
			String hql = "FROM Usuario AS usuario " +
						   "WHERE usuario.cpfLogin = ?";
			Query query = conSession.createQuery(hql);
			query.setParameter(0, cpflogin);
			List<?> results = query.list();
			Usuario usuario = new Usuario();
			if(query.list().isEmpty()) {
				usuario = null;
			}else {
				usuario = (Usuario) results.get(0);	
			}
			conSession.close();
			return usuario;
		} catch(HibernateException e){
			e.printStackTrace();
			return null;
		}
	}
}