package com.mediacaovirtual.dao;

import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;

import com.mediacaovirtual.controller.Banco;
import com.mediacaovirtual.model.Nucleo;

public class NucleoDAO {
	
	public List<Nucleo> listarNucleos(){
		try {
			Banco con = new Banco();
			Session sessionCon = con.getConexao();
			String hsql = "FROM Nucleo AS nucleo";
			Query results = sessionCon.createQuery(hsql);
			@SuppressWarnings("unchecked")
			List<Nucleo> list = results.list();
			sessionCon.close();
			return list;
		} catch (HibernateException e){
			e.printStackTrace();
			return null;
		}
	}

}
