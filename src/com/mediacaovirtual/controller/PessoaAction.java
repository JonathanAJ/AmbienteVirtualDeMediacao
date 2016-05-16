package com.mediacaovirtual.controller;

import java.util.Map;

import com.mediacaovirtual.dao.PessoaDAO;
import com.mediacaovirtual.dao.UsuarioDAO;
import com.mediacaovirtual.model.Pessoa;
import com.mediacaovirtual.model.Usuario;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

@SuppressWarnings("serial")
public class PessoaAction extends ActionSupport{
	
	private Pessoa pessoa = new Pessoa();
	private Usuario usuario = new Usuario();
	
	public Pessoa getPessoa() {
		return pessoa;
	}
	public void setPessoa(Pessoa pessoa) {
		this.pessoa = pessoa;
	}
	public Usuario getUsuario() {
		return usuario;
	}
	public void setUsuario(Usuario usuario) {
		this.usuario = usuario;
	}
	
	private PessoaDAO pessoaDAO = new PessoaDAO();
	private UsuarioDAO usuarioDAO = new UsuarioDAO();
	
	private Map<String, Object> session = ActionContext.getContext().getSession();
	
	public String cadastrar(){
		// validações
		if(pessoa.getBairro().getId() == 0){
			return "erro_bairro";	
		
		}else{
			Usuario usuarioSessao = (Usuario) session.get("usuario");
			pessoa.setId(usuarioSessao.getPessoa().getId());
			pessoa.setImagem(usuarioSessao.getPessoa().getImagem());
			
			if(pessoaDAO.updatePessoa(pessoa)){
				/**
				 * Após atualizar, busca o novo usuário para atualizá-lo na sessão
				 */
				Usuario usuarioAtual = usuarioDAO.getUsuario(usuarioSessao.getCpfLogin());
				session.put("usuario", usuarioAtual);
				
				return "sucesso";
			}else{
				return "erro";
			}
		}
		
	}
	
	public String mudarImagem(){
		
		Usuario usuarioSessao = (Usuario) session.get("usuario");
		
		Pessoa newPessoa = usuarioSessao.getPessoa();
		newPessoa.setImagem(pessoa.getImagem());
		
		if(pessoaDAO.updatePessoa(newPessoa)){
			/**
			 * Após atualizar, busca o novo usuário para atualizá-lo na sessão
			 */
			Usuario usuarioAtual = usuarioDAO.getUsuario(usuarioSessao.getCpfLogin());
			session.put("usuario", usuarioAtual);
			
			return "sucesso";
		}else{
			return "erro";
		}
			
	}

}
