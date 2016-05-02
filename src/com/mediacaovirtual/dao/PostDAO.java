package com.mediacaovirtual.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.mediacaovirtual.controller.Banco;

public class PostDAO {
	
	public boolean createPost(String texto, int id_pertence, int id_categoria_pertence){
		try {
			Connection con = new Banco().getConexao();
			String query = "INSERT INTO posts (texto, id_pertence, id_categoria_pertence) VALUES (?, ?, ?)";
			PreparedStatement pstm = con.prepareStatement(query);
			pstm.setString(1, texto);
			pstm.setInt(2, id_pertence);
			pstm.setInt(3, id_categoria_pertence);
			pstm.executeUpdate();
			pstm.close();
			con.close();
			System.out.println("Criado post com sucesso!");
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
	}
}