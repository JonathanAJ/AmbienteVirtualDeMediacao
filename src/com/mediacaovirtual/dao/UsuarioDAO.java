package com.mediacaovirtual.dao;

import java.util.List;


import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.mediacaovirtual.controller.Banco;
import com.mediacaovirtual.model.Pessoa;
import com.mediacaovirtual.model.Usuario;

public class UsuarioDAO {
	
	public boolean createUsuario(Usuario usuario){
		PessoaDAO pessoaDAO = new PessoaDAO();
		Session conSession = Banco.getConexao();
		try{
			Usuario usuarioTmp = getUsuario(usuario.getCpfLogin());
			if(usuarioTmp == null) {
				Pessoa pessoa = pessoaDAO.getPessoaCriada();
				conSession = Banco.getConexao();
				if(pessoa != null) {
					usuario.setPessoa(pessoa);
					Transaction tx = conSession.beginTransaction();
					conSession.save(usuario);
					tx.commit();
					return true;
					
				}else{
					return false;
				
				}
			}else{
				return false;
			}
			
		} catch (HibernateException e) {
			e.printStackTrace();
			return false;
			
		} finally {
			conSession.close();
		}
	}
	
	public Usuario getUsuario(String cpflogin, String senha){
		Session conSession = Banco.getConexao();
		try {
			String hql = "FROM Usuario AS usuario " +
						   "WHERE usuario.cpfLogin = ? AND usuario.senha = ?";
			Query query = conSession.createQuery(hql);
			query.setParameter(0, cpflogin);
			query.setParameter(1, senha);
			List<?> results = query.list();
			Usuario usuario;
			if(query.list().isEmpty()) {
				usuario = null;
			}else {
				usuario = (Usuario) results.get(0);	
			}
			return usuario;
			
		} catch(HibernateException e){
			e.printStackTrace();
			return null;
			
		} finally {
			conSession.close();
		}
	}

	public Usuario getUsuario(String cpflogin){
		Session conSession = Banco.getConexao();
		try {
			String hql = "FROM Usuario AS usuario " +
						   "WHERE usuario.cpfLogin = ?";
			Query query = conSession.createQuery(hql);
			query.setParameter(0, cpflogin);
			List<?> results = query.list();
			Usuario usuario;
			if(query.list().isEmpty()) {
				usuario = null;
			}else {
				usuario = (Usuario) results.get(0);	
			}
			return usuario;
			
		} catch(HibernateException e){
			e.printStackTrace();
			return null;
			
		} finally {
			conSession.close();
		}
	}
}