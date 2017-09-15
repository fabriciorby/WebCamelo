package br.edu.ufabc.webcamelo.controller;

import java.io.IOException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import br.edu.ufabc.webcamelo.dao.UsuarioDAO;
import br.edu.ufabc.webcamelo.modelo.Usuario;

@Controller
public class LoginController {
	@RequestMapping("login")
	public String login(HttpServletRequest req, Model model) {
		return "login";
	}
	@RequestMapping("loginUsuario")
	public String loginUsuario(Usuario usuario, HttpServletRequest req, HttpServletResponse resp, Model model) throws IOException {
		HttpSession session = req.getSession();
		UsuarioDAO dao = new UsuarioDAO();
		if(usuario == null || usuario.getLogin() == null) {
			model.addAttribute("msg", "Por favor, faça login no sistema!");
		}
		else if (dao.estaCadastrado(usuario.getLogin()) && dao.checaPermissao(usuario)) {
			usuario = dao.getUsuario(usuario.getLogin());
			session.setAttribute("usuario", usuario);
			req.setAttribute("nome", usuario);
			req.setAttribute("logado", true);
			return "index";
		}
		else {
			session.setAttribute("usuario", null);
			model.addAttribute("msg", "Usuário ou senha incorreto(s)!");
		}
		return "login";
	}
	@RequestMapping("logout")
	public String logout(HttpServletRequest req, Model model) {
		HttpSession session = req.getSession();
		session.invalidate();
		req.setAttribute("logado", false);
		return "index";
	}
	@RequestMapping("cadastro")
	public String cadastro() {
		return "cadastro";
	}
	@RequestMapping("cadastroUsuario")
	public String cadastroUsuario(Usuario usuario, HttpServletRequest req, Model model) {
		UsuarioDAO dao = new UsuarioDAO();
		if ((usuario.getLogin() == "" || usuario.getLogin() == null) 
				&& (usuario.getSenha() == "" || usuario.getSenha() == null))
		{
			req.setAttribute("msg", "Os campos usuário/senha não podem estar vazios!");
			return "cadastro";
		}
		else if (dao.estaCadastrado(usuario.getLogin()))
		{
			req.setAttribute("msg", "Este usuário já está cadastrado!");
			return "cadastro";
		}
		else
		{
			dao.cadastra(usuario);
			req.setAttribute("msg", "Usuário cadastrado com sucesso!");
			return "sucesso";
		}
	}
}
