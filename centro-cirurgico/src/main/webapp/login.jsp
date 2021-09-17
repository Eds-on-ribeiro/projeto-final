<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/bootstrap.min.css">

<title>Login</title>
</head>
<body>
<a href="menu.jsp" >Sair</a>
	<form action="loginservlet" method="post">
		<fieldset>
			<legend>ACESSAR</legend>
			<label for="login">Login:</label> <input class="larguraTexto"
				type="text" id="login" name="login" autocomplete="off"
				placeholder="Digite seu login"> <label for="senha">Senha:</label>
			<input class="larguraTexto" type="password" name="senha" id="senha"
				placeholder="Digite sua senha"> <input type="submit"
				class="bt" value="Acessar">
		</fieldset>
	</form>
	<%
	String erro = request.getParameter("erro");
	if (erro != null) {
	%>

	<script type="text/javascript">
		alert("Login ou senha não encontrado");
	</script>

	<%
	}
	%>
</body>
</html>