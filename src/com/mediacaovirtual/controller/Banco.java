package com.mediacaovirtual.controller;

import java.sql.*;

public class Banco {
	
	public Connection getConexao(){
		Connection conexao = null;
		String url = "jdbc:postgresql://localhost:5432/";
		String bd = "bdMediacaoVirtual";
		String usuario = "postgres";
		String senha = "";
		
		try {	
			Class.forName("org.postgresql.Driver");
			conexao = DriverManager.getConnection(url+bd, usuario, senha);
		} catch (Exception e){
			e.printStackTrace();
		}
		
		return conexao;
		
	}
}
