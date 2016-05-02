package com.mediacaovirtual.controller;

import com.mediacaovirtual.dao.PostDAO;
import com.mediacaovirtual.model.Post;
import com.opensymphony.xwork2.ActionSupport;

@SuppressWarnings("serial")
public class PostAction extends ActionSupport{
	
	private Post post = new Post();
	private PostDAO dao = new PostDAO();
	
	public PostDAO getDao() {
		return dao;
	}
	public void setDao(PostDAO dao) {
		this.dao = dao;
	}
	public Post getPost() {
		return post;
	}
	public void setPost(Post post) {
		this.post = post;
	}

	public String cadastrar(){
		if(dao.createPost(post.getTexto(), post.getIdPertence(), post.getIdCategoria())){
			return "sucesso";	
		}else{
			return "erro";
		}
	}
}