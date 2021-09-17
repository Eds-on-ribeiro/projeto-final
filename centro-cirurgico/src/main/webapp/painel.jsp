<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
<title>Painel Centro Cir�rgico</title>
<link rel="stylesheet" href="css/bootstrap.min.css">
</head>
<body>
<a class="bt" href="login.jsp" >Entrar</a>

	<p>
			<img src="img/Bandeira_do_Distrito_Federal_Brasil.png" height="100px" >
		<script>
			var myVar = setInterval(myTimer, 1000);
			function myTimer() {
				var d = new Date();
				document.getElementById("dt-hora").innerHTML = d.getDate()+'/'+(d.getMonth()+1)+'/'+d.getFullYear()+' '+ d
						.toLocaleTimeString();

				var tabela = localStorage.getItem('corpo-tabela');

				document.getElementById("corpo-tabela").innerHTML = tabela;
			}
			documento.myTimer();
		</script>
		Hospital Regional de Taguatinga|Secretaria de Estado de Sa�de do
		Distrito Federal| Pacientes no Centro Cir�gico - <span id="dt-hora"></span>
	</p>
	<table class="table table-striped">
		<thead>
			<tr>
				<th width="40%">Nome do paciente</th>
				<th width="20%">Status</th>
				<th width="10%">In�cio Prev�sto</th>
				<th width="10%">In�cio da Cirurgia</th>
				<th width="10%">Fim da Cirurgia</th>
				<th width="10%">Sa�da Prevista</th>
			</tr>
		</thead>
		<tbody id="corpo-tabela" class="font-weight-bold text-monospace">

		</tbody>
	</table>

</body>
</html>
