package com.mediacaovirtual.controller;

import java.util.Map;

import com.mediacaovirtual.dao.PostDAO;
import com.mediacaovirtual.model.Post;
import com.mediacaovirtual.model.Usuario;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

@SuppressWarnings("serial")
public class PostAction extends ActionSupport{
	
	private Post post = new Post();
	private PostDAO postDAO = new PostDAO();
	
	public Post getPost() {
		return post;
	}
	public void setPost(Post post) {
		this.post = post;
	}
	public String cadastrar(){
		// validações
		if(post.getCategoria().getId() == 0){
			return "erro_categoria";
		}else if(post.getTexto().length() < 100){
			return "erro_texto";
		}else{
			Map<String, Object> session = ActionContext.getContext().getSession();
			post.setDono((Usuario) session.get("usuario"));
			if(postDAO.createPost(post)){
				return "sucesso";
			}else{
				return "erro";
			}
		}
	}
}