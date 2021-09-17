<%@page import="org.senai.model.Usuario"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet" href="css/bootstrap.min.css">

<style>
ul {
	background-color: #eee;
	list-style-type: none;
	margin: 0;
	padding: 0;
	overflow: hidden;
	width: 100%;
	margin: auto;
}

li {
	float: left;
}

li a {
	color: black;
	padding: 16px;
	display: block;
	text-align: center;
	text-decoration: none;
}

li a:hover {
	background-color: #ddd;
}

#dadosUsuario {
	padding: 16px;
	display: block;
	text-align: center;
	float: right;
}
</style>
<ul>
	<li><a href="painel.jsp">Painel princial</a></li>

	<%
	Usuario usuario = (Usuario) request.getSession().getAttribute("usuario");
	boolean verLista = false;
	if (usuario != null) {
		verLista = true;
	%>
	<li><a href="gerenciar-painel.jsp">Gerenciar painel</a></li>
	<li><a href="alterarSenha.jsp">Alterar Senha</a></li>
	<li><a href="loginservlet?acao=sair">Logout</a></li>
	<span id="nome">Bem vindo:<%=usuario.getNome()%></span>
	<%
	} else {
	%>
	<li><a id="log" href="login.jsp">Login</a></li>
	<%
	}
	%>


</ul>