package com.mediacaovirtual.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

@Entity
public class Bairro {
	
	@Id
	@GeneratedValue
	private int id;
	
	@Column(length=90)
	private String nome;
	
	private char regional;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getNome() {
		return nome;
	}
	public void setNome(String nome) {
		this.nome = nome;
	}
	public char getRegional() {
		return regional;
	}
	public void setRegional(char regional) {
		this.regional = regional;
	}
	
	
}
