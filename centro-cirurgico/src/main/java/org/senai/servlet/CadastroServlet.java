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

@WebServlet("/cadastroServlet")
public class CadastroServlet extends HttpServlet {

	protected void service(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {

		PrintWriter out = res.getWriter();

		String nome = req.getParameter("nome");
		String email = req.getParameter("email");
		String senha = req.getParameter("senha");

		if (nome != null) {
			try {
				UsuarioDao usuarioDao = new UsuarioDao();
				boolean incluiu = usuarioDao.incluir(new Usuario(nome, email, senha));
				if (incluiu) {
					System.out.println("Usuario incluido com sucesso");
				} else {
					System.out.println("Erro ao incluir usuario");
				}
			} catch (Exception e1) {
				e1.printStackTrace();

			res.sendRedirect("lista-paciente.jsp");
				
			}
		}
	}
}