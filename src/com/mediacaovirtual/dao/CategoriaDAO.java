package com.mediacaovirtual.dao;

import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import com.mediacaovirtual.controller.Banco;
import com.mediacaovirtual.model.Categoria;

public class CategoriaDAO {
	
	private Banco bd = new Banco();
	
	public List<Categoria> listarCategorias(){
		Session sessionCon = bd.getConexao();
		try {
			String hsql = "FROM Categoria AS cat";
			Query results = sessionCon.createQuery(hsql);
			@SuppressWarnings("unchecked")
			List<Categoria> list = results.list();
			return list;
		} catch (HibernateException e){
			e.printStackTrace();
			return null;
		} finally {
			sessionCon.close();
		}
	}

}
