package com.mediacaovirtual.controller;

import com.mediacaovirtual.dao.UsuarioDAO;
import com.mediacaovirtual.model.Usuario;
import com.opensymphony.xwork2.ActionSupport;

@SuppressWarnings("serial")
public class LoginAction extends ActionSupport{
	
	private UsuarioDAO dao = new UsuarioDAO();
	private Usuario usuario = new Usuario();
	private String info;
	
	public Usuario getUsuario() {
		return usuario;
	}

	public void setUsuario(Usuario usuario) {
		this.usuario = usuario;
	}

	public String getInfo() {
		return info;
	}

	public void setInfo(String info) {
		this.info = info;
	}

	public String logar(){
		boolean login = dao.isUsuario(usuario.getCpfLogin(), usuario.getSenha());
		if(login){
			return "sucesso";
		}else{
			setInfo("Erro_Login");
			return "erro";
		}
	}

	public String cadastrar(){
		boolean cadastro = dao.createUsuario(usuario.getCpfLogin(), usuario.getSenha(), usuario.getNome());
		if(cadastro){
			setInfo("Ok_Cadastro");
			return "sucesso";
		}else{
			setInfo("Erro_Cadastro");
			return "erro";
		}
	}
}