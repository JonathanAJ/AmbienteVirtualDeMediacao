package com.mediacaovirtual.model;

public class Post {

	private int id;
	private int idPertence;
	private int idCategoria;
	private String texto;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getIdPertence() {
		return idPertence;
	}
	public void setIdPertence(int idPertence) {
		this.idPertence = idPertence;
	}
	public int getIdCategoria() {
		return idCategoria;
	}
	public void setIdCategoria(int idCategoria) {
		this.idCategoria = idCategoria;
	}
	public String getTexto() {
		return texto;
	}
	public void setTexto(String texto) {
		this.texto = texto;
	}
	
}
