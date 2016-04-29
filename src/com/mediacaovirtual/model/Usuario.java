package com.mediacaovirtual.model;

/**
 * @author jonathan
 *
 */
public class Usuario {
	
	private int id;
	private String nome;
	private String cpfLogin;
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