package br.edu.ufabc.webcamelo.controller;

import javax.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import br.edu.ufabc.webcamelo.dao.UsuarioDAO;
import br.edu.ufabc.webcamelo.modelo.Usuario;

@Controller
public class UsuarioController {

	@RequestMapping("user/carteira")
	public String carteira() {
		return "user/carteira";
	}
	
	@RequestMapping("user/adicionaCarteira")
	public String adicionaCarteira(Double carteira, HttpServletRequest req) {
		UsuarioDAO dao = new UsuarioDAO();
		Usuario usuario = new Usuario();
		usuario = (Usuario) req.getAttribute("nome");
		usuario.setCarteira(usuario.getCarteira() + carteira);
		dao.alteraCarteira(usuario);
		req.setAttribute("nome", usuario);
		req.setAttribute("msg", "Fundos adicionados com sucesso!");
		return "sucesso";
	}
	
	@RequestMapping("user/perfil")
	public String perfil() {
		return "user/perfil";
	}
	
	@RequestMapping("user/editarPerfil")
	public String editarPerfil(Usuario perfil, HttpServletRequest req) {
		UsuarioDAO dao = new UsuarioDAO();
		Usuario usuario = new Usuario();
		usuario = (Usuario) req.getAttribute("nome");
		usuario.setEmail(perfil.getEmail());
		usuario.setEndereco(perfil.getEndereco());
		usuario.setIdEstado(perfil.getIdEstado());
		dao.alteraPerfil(usuario);
		req.setAttribute("nome", usuario);
		req.setAttribute("msg", "Perfil alterado com sucesso!");
		return "sucesso";
	}
	
	@RequestMapping("user/senha")
	public String senha() {
		return "user/senha";
	}
	
	@RequestMapping("user/editarSenha")
	public String editarSenha(String senha, HttpServletRequest req) {
		UsuarioDAO dao = new UsuarioDAO();
		Usuario usuario = new Usuario();
		usuario = (Usuario) req.getAttribute("nome");
		usuario.setSenha(senha);
		dao.alteraSenha(usuario);
		req.setAttribute("nome", usuario);
		req.setAttribute("msg", "Senha alterada com sucesso!");
		return "user/perfil";
	}
	
}
