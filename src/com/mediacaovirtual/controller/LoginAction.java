package com.mediacaovirtual.controller;

import java.util.Map;

import com.mediacaovirtual.dao.UsuarioDAO;
import com.mediacaovirtual.model.Usuario;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

@SuppressWarnings("serial")
public class LoginAction extends ActionSupport{
	
	private UsuarioDAO usuarioDao = new UsuarioDAO();
	private Usuario usuario = new Usuario();
	
	public Usuario getUsuario() {
		return usuario;
	}

	public void setUsuario(Usuario usuario) {
		this.usuario = usuario;
	}

	public String logar(){
		Usuario user = usuarioDao.getUsuario(usuario.getCpfLogin(), usuario.getSenha());
		if(user == null){
			return "erro";
		}else{
			Map<String, Object> session = ActionContext.getContext().getSession();
			Usuario usuarioSession = user;
			session.put("usuario", usuarioSession);
			return "sucesso";
		}
	}

	public String logout(){
		Map<String, Object> session = ActionContext.getContext().getSession();
		session.remove("usuario");
		return "sucesso";
	}

	public String cadastrar(){
		if(usuario.getNucleo().getId() == 0){
			return "erro_nucleo";
			
		}else if(usuario.getNome().isEmpty() || usuario.getNome() == null){
			return "erro_nome";
			
		}else if(usuario.getCpfLogin().isEmpty() || usuario.getCpfLogin() == null){
			return "erro_cpf";
			
		}else if(usuario.getSenha().isEmpty() || usuario.getSenha() == null){
			return "erro_senha";
			
		}else{
			boolean cadastro = usuarioDao.createUsuario(usuario);
			if(cadastro){
				return "sucesso";
			}else{
				return "erro";
			}	
		}
	}
}