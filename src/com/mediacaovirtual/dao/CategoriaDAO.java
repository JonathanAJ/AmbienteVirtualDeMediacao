package com.mediacaovirtual.dao;

import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import com.mediacaovirtual.controller.Banco;
import com.mediacaovirtual.model.Categoria;

public class CategoriaDAO {
	
	public List<Categoria> listarCategorias(){
		try {
			Banco con = new Banco();
			Session sessionCon = con.getConexao();
			String hsql = "FROM Categoria AS cat";
			Query results = sessionCon.createQuery(hsql);
			@SuppressWarnings("unchecked")
			List<Categoria> list = results.list();
			sessionCon.close();
			return list;
		} catch (HibernateException e){
			e.printStackTrace();
			return null;
		}
	}

}
