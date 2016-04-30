package com.mediacaovirtual.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.mediacaovirtual.controller.Banco;
import com.mediacaovirtual.model.Categoria;

public class CategoriaDAO {
	
	public List<Categoria> listarCategorias(){
		List<Categoria> lista = new ArrayList<Categoria>();
		try {
			Connection con = new Banco().getConexao();
			String query = "SELECT id, nome FROM categoria";
			Statement stm = con.createStatement();
			ResultSet rs = stm.executeQuery(query);
			while(rs.next()){
				Categoria cat = new Categoria();
				cat.setId(rs.getInt("id"));
				cat.setNome(rs.getString("nome"));
				lista.add(cat);
			}
			rs.close();
			stm.close();
			con.close();
			return lista;
		} catch (SQLException e){
			e.printStackTrace();
			return lista;
		}
	}

}
