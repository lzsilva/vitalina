<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<html>

<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<link rel="stylesheet" type="text/css" href="css/bootstrap.css" />
<link rel="stylesheet" type="text/css"
	href="css/bootstrap-responsive.css" />

<script src="js/bootstrap.js"></script>
<script src="http://code.jquery.com/jquery.js"></script>
</head>

<body>
	<div class="container">
		<form class="form-signin" method="post" action="ServLogin">
			<input type="hidden" name="acao" value="logar">
			<h3 class="form-signin-heading">Login</h3>
			<h3 class="pull-right">
				<small>Toten de Vitalina - Administra��o</small>
			</h3>

			<input type="text" class="input-block-level"
				placeholder="Nome de Usu�rio" name="nome" id="nome" /> <input
				type="password" class="input-block-level" placeholder="Senha"
				name="senha" id="senha" />

			<button class="btn btn-large btn-primary" type="submit" id="salvar">
				<i class="icon-lock icon-white"></i>&nbsp;Acessar
			</button>
			<%
				if (request.getParameter("erro") != null) {
			%>
			<p>
				<font color="red"> Nome de usu�rio ou senha incorretos. </font>
			</p>
			<%
				}
			%>
		</form>

	</div>
	<!--Fim Container-->
</body>

</html>
