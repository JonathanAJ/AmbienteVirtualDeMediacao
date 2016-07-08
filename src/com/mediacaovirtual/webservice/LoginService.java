package com.mediacaovirtual.webservice;

import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;

import com.mediacaovirtual.dao.UsuarioDAO;
import com.mediacaovirtual.model.Nucleo;
import com.mediacaovirtual.model.Usuario;

@Path("/loginservice")
public class LoginService {
	
	UsuarioDAO usuarioDao = new UsuarioDAO();
//	
//	@POST
//	@Produces("text/xml")
//	@Path("logar/{cpf}/{senha}")
//	public String logar(@PathParam("cpf") String cpfLogin,
//						@PathParam("senha") String senha){
//		boolean login = dao.isUsuario(cpfLogin, senha);
//		if(login){
//			return "<msg>sucesso</msg>";
//		}else{
//			return "<msg>erro</msg>";
//		}
//	}
//
	@POST
	@Produces("text/xml")
	@Path("/cadastrar/{nucleo_id}/{nome}/{cpf}/{senha}")
	public String cadastrar(
							@PathParam("nucleo_id") int nucleoId,
							@PathParam("nome") String nome,
							@PathParam("cpf") String cpfLogin,
							@PathParam("senha") String senha){
		
		Usuario usuario = new Usuario();
		usuario.setNucleo(new Nucleo(nucleoId));
		usuario.setNome(nome);
		usuario.setCpfLogin(cpfLogin);
		usuario.setSenha(senha);
		
		if(usuario.getNucleo().getId() == 0){
			return "<msg>erro_nucleo</msg>";
			
		}else if(usuario.getNome().isEmpty() || usuario.getNome() == null){
			return "<msg>erro_nome</msg>";
			
		}else if(usuario.getCpfLogin().isEmpty() || usuario.getCpfLogin() == null){
			return "<msg>erro_cpf</msg>";
			
		}else if(usuario.getSenha().isEmpty() || usuario.getSenha() == null){
			return "<msg>erro_senha</msg>";
			
		}else{
			boolean cadastro = usuarioDao.createUsuario(usuario);
			if(cadastro){
				return "<msg>sucesso</msg>";
			}else{
				return "<msg>erro_existe</msg>";
			}	
		}
	}
//
//	@DELETE
//	@Produces("text/xml")
//	@Path("deletar/{cpf}/{senha}")
//	public String deletar(@PathParam("cpf") String cpfLogin,
//						 @PathParam("senha") String senha){
//		boolean delete = dao.deleteUsuario(cpfLogin, senha);
//		if(delete){
//			return "<msg>sucesso</msg>";
//		}else{
//			return "<msg>erro</msg>";
//		}
//	}
//
//	@PUT
//	@Produces("text/xml")
//	@Path("atualizar/{cpf}/{senha}/{nSenha}")
//	public String atualizar(@PathParam("cpf") String cpfLogin,
//						 @PathParam("senha") String senha,
//						 @PathParam("nSenha") String nSenha){
//		boolean atualiza = dao.updateUsuario(cpfLogin, senha, nSenha);
//		if(atualiza){
//			return "<msg>sucesso</msg>";
//		}else{
//			return "<msg>erro</msg>";
//		}
//	}
//
//	@GET
//	@Produces("text/xml")
//	@Path("listar/")
//	public String listar(){
//		String xml = "";
//		List<String> lista = dao.listarUsuario();
//		Iterator<String> it = lista.iterator();
//		while(it.hasNext()){
//			String cpf = it.next();
//			xml = "<cpf>" + cpf + "</cpf>" + xml;
//		}
//		return xml;
//	}
}