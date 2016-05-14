package com.mediacaovirtual.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.ForeignKey;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
@Table(name = "comentario_post")
public class ComentarioPost {
	
	@Id
	@GeneratedValue
	private int id;
	
	@Column(columnDefinition = "TEXT")
	private String texto;
	
	@Temporal(TemporalType.TIMESTAMP)
	private Date data = new Date();
	
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
	public Date getData() {
		return data;
	}
	public void setData(Date data) {
		this.data = data;
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
