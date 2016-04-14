package com.mediacaovirtual.controller;

import com.mediacaovirtual.model.Usuario;
import com.opensymphony.xwork2.ActionSupport;

@SuppressWarnings("serial")
public class LoginAction extends ActionSupport{
	
	private Usuario usuario = new Usuario();
	
	public String logar(){
		if(usuario.getCpfLogin().equals("123") && usuario.getSenha().equals("123")){
			return "sucesso";
		}else{
			return "erro";
		}
	}
	
}