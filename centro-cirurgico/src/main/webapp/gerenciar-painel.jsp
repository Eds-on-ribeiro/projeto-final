<%@page import="org.senai.dao.UsuarioDao"%>
<%@page import="org.senai.model.Usuario"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="css/bootstrap.min.css">
<title>Gerenciar Painel Pacientes</title>
</head>
<body>

<%
	Usuario usuario = new Usuario();
	UsuarioDao usuarioDao;
	try {
		int idUsuario = Integer.parseInt(request.getParameter("usuarioId"));
		usuarioDao = new UsuarioDao();
		usuario = usuarioDao.consultar(idUsuario);
	} catch (Exception e) {
		
		e.printStackTrace();
	}
%>
	<div>

		<form action="cadastroServlet">
			<h2>Gerenciar Painel dos Paciente no Centro Cirúrgico</h2>
			<input type="hidden" id="id" name="id" value="<%usuario.getId();%>">
			<div class="form-row">
				<div class="form-group col-md-6">
					<label for="nome">Nome Paciente:</label> <input type="text"
						class="form-control" id="nome" placeholder="Nome" name="nome" value="<%usuario.getNome();%>">
					<label for="nome">E-mail:</label> <input type="text"
						class="form-control" id="email" placeholder="e-mail" name="email" value="<%usuario.getEmail();%>">
					<label for="senha">Senha:</label> <input type="text"
						class="form-control" id="senha" placeholder="Senha" name="senha">
				</div>
				<div class="form-group col-md-3">
					<label for="nome">Status:</label> <select name="status" id="status"
						class="form-control">
						<option value="operatorio">Pré-Operatório</option>
						<option value="sala-cirurgica">Em sala cirúrgica</option>
						<option value="recuperacao">Em recuperação</option>
						<option value="transferido">Transferído</option>
					</select>
				</div>
				<div class="form-group col-md-3">
					<label for="vlocal">Local:</label> <input type="text"
						class="form-control" id="vlocal" placeholder="Sala/Quarto"
						name="vlocal">
				</div>
			</div>
			<div class="form-row">
				<div class="form-group  col-md-3">
					<label for="inicioprevisto">Início Prevísto:</label> <input
						type="time" class="form-control" id="inicioprevisto"
						name="inicioprevisto" size="20">
				</div>
				<div class="form-group  col-md-3">
					<label for="iniciocirurgia">Início Cirurgia:</label> <input
						type="time" class="form-control" id="iniciocirurgia"
						name="inicio-previsto" size="20">
				</div>
				<div class="form-group  col-md-3">
					<label for="fimcirurgia">Fim da Cirurgia:</label> <input
						type="time" class="form-control" id="fimcirurgia"
						name="fimcirurgia" size="20">
				</div>
				<div class="form-group  col-md-3">
					<label for="saidaprevista">Saída Prevísta:</label> <input
						type="time" class="form-control" id="saidaprevista"
						name="saidaprevista" size="20">
				</div>
			</div>
			<button type="button" class="btn btn-secondary" onclick="limpaForm()">Novo</button>
			<!-- 				<button type="button" class="btn btn-primary" onclick="gravar(this)">Gravar</button> -->
			<input type="submit" value="Gravar" />
			<button type="button" class="btn btn-danger" onclick="apagar()">Apagar</button>
		</form>

		<br>
		<table class="table table-hover">
			<thead>
				<tr>
					<th width="40%">Nome do Paciente</th>
					<th width="30%">Status</th>
					<th width="10%">Início Prevísto</th>
					<th width="10%">Início da Cirurgia</th>
					<th width="10%">Fim da Cirurgia</th>
					<th width="10%">Saída Prevista</th>
				</tr>
			</thead>

			<tbody id="corpo-tabela" style="cursor: pointer;">
			</tbody>
		</table>
	</div>
<%@ include file="lista-paciente.jsp"%>
</body>
</html>