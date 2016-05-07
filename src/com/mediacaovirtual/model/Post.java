package com.mediacaovirtual.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.ForeignKey;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

@Entity
public class Post {
	
	@Id
	@GeneratedValue
	private int id;

	@Column(columnDefinition = "TEXT")
	private String texto;
	
	@ManyToOne(optional=false)
    @JoinColumn( foreignKey = @ForeignKey(name = "fk_categoria"))
	private Categoria categoria;
	
	@ManyToOne(optional=false)
    @JoinColumn( foreignKey = @ForeignKey(name = "fk_dono"))
	private Usuario dono;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getTexto() {
		return texto;
	}
	public void setTexto(String texto) {
		this.texto = texto;
	}
	public Categoria getCategoria() {
		return categoria;
	}
	public void setCategoria(Categoria categoria) {
		this.categoria = categoria;
	}
	public Usuario getDono() {
		return dono;
	}
	public void setDono(Usuario dono) {
		this.dono = dono;
	}
	
}
