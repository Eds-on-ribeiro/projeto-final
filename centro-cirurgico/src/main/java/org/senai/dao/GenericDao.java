package org.senai.dao;

import java.io.Serializable;
import java.lang.reflect.ParameterizedType;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import org.senai.db.Conexao;
import org.senai.model.Usuario;

public abstract class GenericDao<T> implements Serializable {
	private static final long serialVersionUID = 1L;
	@SuppressWarnings("rawtypes") 
	private Class classe;
	private Connection connection;

	@SuppressWarnings("rawtypes")
	public GenericDao() throws Exception {
		this.classe = (Class) ((ParameterizedType) getClass().getGenericSuperclass()).getActualTypeArguments()[0];
		this.connection = Conexao.conectar();
	}

	public boolean executePreparedStatement(PreparedStatement pst) {
		
		try {
			pst.execute();
			pst.close();
			this.connection.close();
			return true;

		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}

	public ResultSet executePreparedStatement(String sql) {
		
		try {
			PreparedStatement pst = this.connection.prepareStatement(sql);
			ResultSet rs = pst.executeQuery();
			rs.next();
			pst.close();
			this.connection.close();
			return rs;

		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	public Connection getConnection() {
		return connection;
	}
	
	public List<Usuario> listarUsuario() {
		
		List<Usuario> ls = new ArrayList<>();
		try {
			Connection cont = this.connection;
			PreparedStatement pst = cont.prepareStatement("select * from usuario order by id");
			ResultSet rs = pst.executeQuery();
			while (rs.next()) {
				Usuario p = new Usuario();
				p.setId(rs.getInt("id"));
				p.setNome(rs.getString("nome"));
				p.setEmail(rs.getString("email"));
				ls.add(p);
			}

			cont.close();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return ls;
	}
}
