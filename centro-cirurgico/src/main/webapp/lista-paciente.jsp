<%@page import="org.senai.model.Usuario"%>
<%@page import="org.senai.dao.UsuarioDao"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="org.senai.db.Conexao"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Lista de Pacientes</title>
</head>
<body>
<%	
	UsuarioDao objDao = new UsuarioDao();
 	List<Usuario> ls = objDao.listarUsuario();
 	if (ls.size() > 0) {
		
%> 
	<table>
		<tr>
			<th>ID</th>
			<th>Nome</th>
			<th>E-mail</th>
			<th>Ação</th>
		</tr>
		<%
		for (Usuario p : ls) {
		%>
		<tr>
			<td><%=p.getId()%></td>
			<td><%=p.getNome()%></td>
			<td><%=p.getEmail()%></td>
			<td><a href="gerenciar-painel.jsp?=id">Editar</a></td>
		</tr>
		<%
		}
		%>
	</table>
	<%
	}
	%>

</body>
</html>