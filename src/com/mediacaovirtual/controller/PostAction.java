package com.mediacaovirtual.controller;

import java.util.Map;

import com.mediacaovirtual.dao.ComentarioPostDAO;
import com.mediacaovirtual.dao.PostDAO;
import com.mediacaovirtual.model.ComentarioPost;
import com.mediacaovirtual.model.Post;
import com.mediacaovirtual.model.Usuario;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

@SuppressWarnings("serial")
public class PostAction extends ActionSupport{
	
	private Post post = new Post();
	private ComentarioPost comentario = new ComentarioPost();
	
	public Post getPost() {
		return post;
	}
	public void setPost(Post post) {
		this.post = post;
	}
	
	public ComentarioPost getComentario() {
		return comentario;
	}
	public void setComentario(ComentarioPost comentario) {
		this.comentario = comentario;
	}
	
	private PostDAO postDAO = new PostDAO();
	private ComentarioPostDAO comentarioDAO = new ComentarioPostDAO();
	
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
	
	public String deletarPost(){
		// validações
		Map<String, Object> session = ActionContext.getContext().getSession();
		post.setDono((Usuario) session.get("usuario"));
		
		int postId = getPost().getId();
		int usuarioId = getPost().getDono().getId();
		
		if(postDAO.verificaPost(postId, usuarioId)){
			if(postDAO.deletePost(postId)){
				return "sucesso";
			}else{
				return "erro";
			}
		}else{
			return "erro_404";
		}
	}
	
	public String comentar(){
		// validações
		if(comentario.getTexto().isEmpty() || comentario.getTexto() == null){
			return "erro_comentario";
		}else{
			Map<String, Object> session = ActionContext.getContext().getSession();
			comentario.setDono((Usuario) session.get("usuario"));
			comentario.setPost(post);
			if(comentarioDAO.createComentario(comentario)){
				return "sucesso";
			}else{
				return "erro";
			}
		}
	}
	
}