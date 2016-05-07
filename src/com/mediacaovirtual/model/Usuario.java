package com.mediacaovirtual.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

@Entity
public class Usuario {
	@Id
	@GeneratedValue
	private int id;
	@Column(length=90, nullable=false)
	private String nome;
	@Column(length=11, nullable=false)
	private String cpfLogin;
	@Column(length=20, nullable=false)
	private String senha;
	
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
	public String getCpfLogin() {
		return cpfLogin;
	}
	public void setCpfLogin(String cpfLogin) {
		this.cpfLogin = cpfLogin;
	}
	public String getSenha() {
		return senha;
	}
	public void setSenha(String senha) {
		this.senha = senha;
	}
}