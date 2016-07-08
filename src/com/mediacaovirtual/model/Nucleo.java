package com.mediacaovirtual.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.ForeignKey;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

@Entity
public class Nucleo {
	
	public Nucleo() {
	
	}
	public Nucleo(int id) {
		super();
		this.id = id;
	}
	@Id
	@GeneratedValue
	private int id;
	
	@Column(length = 90)
	private String nome;

	@Column(length = 100)
	private String localizacao;
	
	@Column(length = 20)
	private String telefone;
	
	@ManyToOne(optional = false)
	@JoinColumn(foreignKey = @ForeignKey(name = "fk_bairro"))
	private Bairro bairro;
	
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
	public String getLocalizacao() {
		return localizacao;
	}
	public void setLocalizacao(String localizacao) {
		this.localizacao = localizacao;
	}
	public String getTelefone() {
		return telefone;
	}
	public void setTelefone(String telefone) {
		this.telefone = telefone;
	}
	public Bairro getBairro() {
		return bairro;
	}
	public void setBairro(Bairro bairro) {
		this.bairro = bairro;
	}
}
