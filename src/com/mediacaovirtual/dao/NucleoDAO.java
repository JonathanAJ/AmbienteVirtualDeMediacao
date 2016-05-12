package com.mediacaovirtual.dao;

import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;

import com.mediacaovirtual.controller.Banco;
import com.mediacaovirtual.model.Nucleo;

public class NucleoDAO {
	
	public List<Nucleo> listarNucleos(){
		Session conSession = Banco.getConexao();
		try {
			String hql = "FROM Nucleo AS nucleo";
			Query results = conSession.createQuery(hql);
			@SuppressWarnings("unchecked")
			List<Nucleo> list = results.list();
			return list;
			
		} catch (HibernateException e){
			e.printStackTrace();
			return null;
			
		} finally {
			conSession.close();
		}
	}

}
