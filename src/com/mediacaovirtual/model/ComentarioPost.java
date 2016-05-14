package com.mediacaovirtual.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.ForeignKey;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "comentario_post")
public class ComentarioPost {
	
	@Id
	@GeneratedValue
	private int id;
	
	@Column(columnDefinition = "TEXT")
	private String texto;
	
	@ManyToOne
	@JoinColumn(foreignKey = @ForeignKey(name = "fk_dono"))
	private Usuario dono;
	
	@ManyToOne
	@JoinColumn(foreignKey = @ForeignKey(name = "fk_post"))
	private Post post;
	
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
	public Usuario getDono() {
		return dono;
	}
	public void setDono(Usuario dono) {
		this.dono = dono;
	}
	public Post getPost() {
		return post;
	}
	public void setPost(Post post) {
		this.post = post;
	}
	
}
