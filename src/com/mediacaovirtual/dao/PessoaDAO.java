package com.mediacaovirtual.dao;

import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.mediacaovirtual.controller.Banco;
import com.mediacaovirtual.model.Pessoa;

public class PessoaDAO {
	
	public boolean updatePessoa(Pessoa pessoa){
		Session conSession = Banco.getConexao();
		
		try {
			Transaction tx = conSession.beginTransaction();
			conSession.update(pessoa);;
			tx.commit();
			return true;
			
		} catch (HibernateException e) {
			e.printStackTrace();
			return false;
			
		} finally {
			conSession.close();
			
		}
	}
	
	public int createPessoa(Pessoa pessoa){
		Session conSession = Banco.getConexao();
		try {
			Transaction tx = conSession.beginTransaction();
			int idGerado = (int) conSession.save(pessoa);
			tx.commit();
			return idGerado;
			
		} catch (HibernateException e) {
			e.printStackTrace();
			return -1;
			
		} finally {
			conSession.close();
			
		}
	}
	
	public Pessoa getPessoa(int id){
		Session conSession = Banco.getConexao();
		try {
			String hql = "FROM Pessoa AS pessoa WHERE pessoa.id = ?";
			Query query = conSession.createQuery(hql);
			query.setParameter(0, id);
			List<?> results = query.list();
			Pessoa pessoa;
			if(query.list().isEmpty()) {
				pessoa = null;
			}else {
				pessoa = (Pessoa) results.get(0);	
			}
			return pessoa;
			
		} catch(HibernateException e){
			e.printStackTrace();
			return null;
			
		} finally {
			conSession.close();
		}
	}
	
	public Pessoa getPessoaCriada(){
		int idGeradoPessoa = createPessoa(new Pessoa());
		
		if(idGeradoPessoa == -1) {
			return null;
			
		} else {
			return getPessoa(idGeradoPessoa);
		}
	}

}
