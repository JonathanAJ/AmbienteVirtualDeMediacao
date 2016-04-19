package com.mediacaovirtual.webservice;

import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.PUT;

import java.util.Iterator;
import java.util.List;

import javax.ws.rs.DELETE;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;

import com.mediacaovirtual.dao.UsuarioDAO;

@Path("/LoginService")
public class LoginService {
	
	UsuarioDAO dao = new UsuarioDAO();
	
	@POST
	@Produces("text/xml")
	@Path("logar/{cpf}/{senha}")
	public String logar(@PathParam("cpf") String cpfLogin,
						@PathParam("senha") String senha){
		boolean login = dao.isUsuario(cpfLogin, senha);
		if(login){
			return "<msg>sucesso</msg>";
		}else{
			return "<msg>erro</msg>";
		}
	}

	@POST
	@Produces("text/xml")
	@Path("cadastrar/{cpf}/{senha}")
	public String cadastrar(@PathParam("cpf") String cpfLogin,
							@PathParam("senha") String senha){
		boolean cadastro = dao.createUsuario(cpfLogin, senha);
		if(cadastro){
			return "<msg>sucesso</msg>";
		}else{
			return "<msg>erro</msg>";
		}
	}

	@DELETE
	@Produces("text/xml")
	@Path("deletar/{cpf}/{senha}")
	public String deletar(@PathParam("cpf") String cpfLogin,
						 @PathParam("senha") String senha){
		boolean delete = dao.deleteUsuario(cpfLogin, senha);
		if(delete){
			return "<msg>sucesso</msg>";
		}else{
			return "<msg>erro</msg>";
		}
	}

	@PUT
	@Produces("text/xml")
	@Path("atualizar/{cpf}/{senha}/{nSenha}")
	public String atualizar(@PathParam("cpf") String cpfLogin,
						 @PathParam("senha") String senha,
						 @PathParam("nSenha") String nSenha){
		boolean atualiza = dao.updateUsuario(cpfLogin, senha, nSenha);
		if(atualiza){
			return "<msg>sucesso</msg>";
		}else{
			return "<msg>erro</msg>";
		}
	}

	@GET
	@Produces("text/xml")
	@Path("listar/")
	public String listar(){
		String xml = "";
		List<String> lista = dao.listarUsuario();
		Iterator<String> it = lista.iterator();
		while(it.hasNext()){
			String cpf = it.next();
			xml = "<cpf>" + cpf + "</cpf>" + xml;
		}
		return xml;
	}
}