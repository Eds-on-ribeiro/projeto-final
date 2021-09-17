package org.senai.db;

import java.sql.Connection;
import java.sql.DriverManager;

public class Conexao {

	public static Connection conectar() throws Exception {

		try {
			Class.forName("org.postgresql.Driver");
			String url = "jdbc:postgresql://chunee.db.elephantsql.com:5432/nzvbtkar";
			String usuarioDb = "nzvbtkar";
			String senhaDb = "4dgqt5kGpJD1tmrnP4odb46YCbYejbbE";
			return DriverManager.getConnection(url, usuarioDb, senhaDb);
		} catch (Exception e) {
			System.out.println("Erro de conexao");
			e.printStackTrace();
			return null;
		}

	}
}
