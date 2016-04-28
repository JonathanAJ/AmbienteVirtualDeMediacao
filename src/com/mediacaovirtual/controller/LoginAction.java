package com.mediacaovirtual.controller;

import com.mediacaovirtual.dao.UsuarioDAO;
import com.mediacaovirtual.model.Usuario;
import com.opensymphony.xwork2.ActionSupport;

@SuppressWarnings("serial")
public class LoginAction extends ActionSupport{
	
	private UsuarioDAO dao = new UsuarioDAO();
	private Usuario usuario = new Usuario();
	
	public Usuario getUsuario() {
		return usuario;
	}

	public void setUsuario(Usuario usuario) {
		this.usuario = usuario;
	}

	public String logar(){
		boolean login = dao.isUsuario(usuario.getCpfLogin(), usuario.getSenha());
		if(login){
			return "sucesso";
		}else{
			return "erro";
		}
	}

	public String cadastrar(){
		boolean cadastro = dao.createUsuario(usuario.getCpfLogin(), usuario.getSenha(), usuario.getNome());
		if(cadastro){
			return "sucesso";
		}else{
			return "erro";
		}
	}
}