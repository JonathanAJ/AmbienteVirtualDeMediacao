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
		Usuario user = usuarioDao.getUsuario(usuario.getCpfLogin(), usuario.getSenha());
		if(user == null){
			setInfo("Erro_Login");
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
		boolean cadastro = usuarioDao.createUsuario(usuario);
		if(cadastro){
			setInfo("Ok_Cadastro");
			return "sucesso";
		}else{
			setInfo("Erro_Cadastro");
			return "erro";
		}
		
	}
}