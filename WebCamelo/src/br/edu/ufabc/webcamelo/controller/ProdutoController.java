package br.edu.ufabc.webcamelo.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import br.edu.ufabc.webcamelo.dao.ProdutoDAO;
import br.edu.ufabc.webcamelo.dao.UsuarioDAO;
import br.edu.ufabc.webcamelo.modelo.Produto;
import br.edu.ufabc.webcamelo.modelo.Usuario;

@Controller
public class ProdutoController {
	@RequestMapping("/")
	public String home() {
		return "index";
	}
	@RequestMapping("index")
	public String index() {
		return "index";
	}
	@RequestMapping("listar")
	public String busca() {
		return "listar";
	}
	@RequestMapping("user/inserir")
	public String inserir() {
		return "user/inserir";
	}
	@RequestMapping("produto")
	public String produto(Produto produto, HttpServletRequest req, HttpServletResponse resp) {
		req.setAttribute("id", produto.getId());
		return "produto";
	}
	@RequestMapping("user/anunciar")
	public String anunciar(Produto produto, HttpServletRequest req, HttpServletResponse resp, HttpSession session) {
		Usuario usuario = (Usuario) session.getAttribute("usuario");
		ProdutoDAO dao = new ProdutoDAO();
		produto.setIdVendedor(usuario.getId());
		
		dao.insere(produto);
		
		req.setAttribute("msg", "Produto anunciado com sucesso!");
		
		return "sucesso";
	}
	@RequestMapping("user/comprarProduto")
	public String compraProduto(Long id, HttpServletRequest req, HttpServletResponse resp, HttpSession session) {
		UsuarioDAO uDao = new UsuarioDAO();
		ProdutoDAO pDao = new ProdutoDAO();
		Usuario usuario = new Usuario();
		Produto produto = new Produto();
		produto = pDao.getProduto(id).get(0);
		usuario = (Usuario) req.getAttribute("nome");
		usuario.setCarteira(usuario.getCarteira() - produto.getPreco());
		uDao.alteraCarteira(usuario);
		req.setAttribute("nome", usuario);
		usuario = uDao.getUsuario(produto.getIdVendedor());
		usuario.setCarteira(usuario.getCarteira() + produto.getPreco());
		uDao.alteraCarteira(usuario);
		pDao.remove(produto);
		req.setAttribute("msg", "Produto comprado com sucesso!");
		return "sucesso";
	}
}
