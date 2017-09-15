package br.edu.ufabc.webcamelo.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import br.edu.ufabc.webcamelo.modelo.Usuario;
public class InterceptadorGeral extends HandlerInterceptorAdapter {
	@Override
	public boolean preHandle(HttpServletRequest req, HttpServletResponse resp,
	Object controller) throws Exception {
		HttpSession session = ((HttpServletRequest) req).getSession();
		Usuario usuario = (Usuario) session.getAttribute("usuario");
		if(usuario != null)
		{
			req.setAttribute("logado", true);
			req.setAttribute("nome", usuario);
		}
		else
		{
			req.setAttribute("logado", false);
		}
		return true;
	}
}