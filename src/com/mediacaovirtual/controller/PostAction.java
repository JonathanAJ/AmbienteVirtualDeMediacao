package com.mediacaovirtual.controller;

import com.mediacaovirtual.model.Post;
import com.opensymphony.xwork2.ActionSupport;

@SuppressWarnings("serial")
public class PostAction extends ActionSupport{
	
	private Post post = new Post();
		
	public Post getPost() {
		return post;
	}
	public void setPost(Post post) {
		this.post = post;
	}

	public String cadastrar(){
		System.out.println("Categoria: " + post.getIdCategoria());
		System.out.println("Texto: " + post.getTexto());
		System.out.println("Usuário: " + post.getIdPertence());
		return "sucesso";
	}
}