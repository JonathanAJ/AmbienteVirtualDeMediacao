package com.mediacaovirtual.dao;

import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;

import com.mediacaovirtual.controller.Banco;
import com.mediacaovirtual.model.Bairro;

public class BairroDAO {
	
	public List<Bairro> listarBairros(){
		Session sessionCon = Banco.getConexao();
		try {
			String hsql = "FROM Bairro AS bairro";
			Query results = sessionCon.createQuery(hsql);
			@SuppressWarnings("unchecked")
			List<Bairro> list = results.list();
			return list;
		
		} catch (HibernateException e){
			e.printStackTrace();
			return null;
			
		} finally {
			sessionCon.close();
		}
	}

}
