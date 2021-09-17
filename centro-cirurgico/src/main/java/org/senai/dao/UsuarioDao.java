package org.senai.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.senai.model.Usuario;

public class UsuarioDao extends GenericDao<Usuario> {

	public UsuarioDao() throws Exception {

	}

	public boolean incluir(Usuario usuario) throws SQLException {
		String sql = "insert into usuario (nome, email, senha)" + "values(?,?,?)";

		PreparedStatement pst = this.getConnection().prepareStatement(sql);
		pst.setString(1, usuario.getNome());
		pst.setString(2, usuario.getEmail());
		pst.setString(3, usuario.getSenha());

		return super.executePreparedStatement(pst);
	}

	public Usuario validarLogin(String login, String senha) {

		try {
			PreparedStatement pst = super.getConnection().prepareStatement(
					"select * from usuario WHERE email = '" + login + "' AND senha = '" + senha + "'");
			ResultSet result = pst.executeQuery();
			result.next();

			Usuario usuario = new Usuario(result.getInt("id"), result.getString("nome"), result.getString("email"),
					result.getString("senha"));
			pst.close();
			super.getConnection().close();
			return usuario;

		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;

	}

	public Usuario consultar(Integer id) {

		try {
			PreparedStatement pst = super.getConnection().prepareStatement("select * from usuario WHERE id = " + String.valueOf(id));
			ResultSet result = pst.executeQuery();
			result.next();
			Usuario usuario = new Usuario(result.getInt("id"), result.getString("nome"), result.getString("email"), result.getString("senha"));
			pst.close();
			super.getConnection().close();
			return usuario;

		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;

	}
}
