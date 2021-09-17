package org.senai.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.senai.dao.UsuarioDao;
import org.senai.model.Usuario;

@WebServlet("/loginservlet")
public class LoginServlet extends HttpServlet {

	protected void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		String login = req.getParameter("login");
		String senha = req.getParameter("senha");
		
		PrintWriter out = res.getWriter();
		out.println("<html>");
		
		try {
			UsuarioDao usuarioDao = new UsuarioDao();
			Usuario usuario = usuarioDao.validarLogin(login, senha);
			if (usuario != null && usuario.getId() > 0) {
				res.sendRedirect("gerenciar-painel.jsp");
				req.getSession().setAttribute("usuarioId", usuario.getId());
				out.println("Acesso Aprovado.");
			}else {
				res.sendRedirect("login.jsp?erro");
				out.println("Acesso Reprovado.");
			}
		} catch (Exception e) {
			
			e.printStackTrace();
		}
	}
}
