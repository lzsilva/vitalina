<%@ page language="java" contentType="text/html; charset=ISO-8859-1"%>

<%
	response.setHeader("Cache-Control", "no-cache,no-store,must-revalidate");
	response.setHeader("Pragma", "no-cache");
	response.setDateHeader("Expires", 0);
	if (session.getAttribute("login") != null) {
%>

<html>

<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<link rel="stylesheet" type="text/css" href="css/bootstrap.css" />
<link rel="stylesheet" type="text/css"
	href="css/bootstrap-responsive.css" />

<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js"></script>
<script src="js/bootstrap.js"></script>
<title>Administração</title>
</head>

<body>
	<div class="container">
		<div class="hero-unit">
			<div class="navbar">
				<div class="navbar-inner">

					<a class="brand" href="Administracao.jsp">Toten de Vitalina</a>

					<ul class="nav pull-right">
						<li class="dropdown"><a class="dropdown-toggle"
							data-toggle="dropdown" href="#"> Cadastrar <b class="caret"></b>
						</a>
							<ul class="dropdown-menu">
								<li><a href="ListarLinhas.jsp">Linha</a></li>
								<li><a href="ListarEmpresas.jsp">Empresa</a></li>
								<li><a href="ListarLocalidades.jsp">Local</a></li>
								<li><a href="ListarItinerarios.jsp">Itinerário</a></li>
								<li><a href="CadToten.jsp">Toten</a></li>
							</ul></li>
						<li>
							<form method="post" action="ServLogin">
								<button type="submit" class="btn btn-secondary">Sair</button>
								<input type="hidden" name="acao" value="sair" />
							</form>
						</li>
					</ul>

				</div>
				<!--fim navbar-inner-->
			</div>
			<!--fim navbar-->

			<div class="well">
			
				<div class="pull-right">
						<a class="btn btn-primary" href="TelaInicialToten.jsp"> <span
							class="icon-share-alt icon-white"></span>&nbsp; Iniciar Tela do Toten
						</a>
					</div>

				<h2>
					Bem-Vindo,
					<%=session.getAttribute("login")%>!<br /> <small> Cadastre
						novas entidades para o sistema.</small>
				</h2>
				<br />

				<form action="">
					<button class="btn btn-large btn-primary" type="submit"
						formaction="ListarLinhas.jsp">
						<span class="icon-plus-sign icon-white"></span>&nbsp;Linha
					</button>
					<button class="btn btn-large btn-success" type="submit"
						formaction="ListarEmpresas.jsp">
						<span class="icon-plus-sign icon-white"></span>&nbsp;Empresa
					</button>
					<button class="btn btn-large btn-warning" type="submit"
						formaction="ListarLocalidades.jsp">
						<span class="icon-plus-sign icon-white"></span>&nbsp;Local
					</button>
					<button class="btn btn-large btn-info" type="submit"
						formaction="ListarItinerarios.jsp">
						<span class="icon-plus-sign icon-white"></span>&nbsp;Itinerário
					</button>
					<button class="btn btn-large btn-danger" type="submit"
						formaction="CadToten.jsp">
						<span class="icon-plus-sign icon-white"></span>&nbsp;Toten
					</button>
				</form>

			</div>

			<h3 class="pull-right">
				<small>Toten de Vitalina - SI-IFMA Versão 1.0</small>
			</h3>

		</div>
		<!--fim hero-unit-->
	</div>
	<!--fim container-->
</body>
</html>


<%
	} else {
%>
<jsp:forward page="Login.jsp"></jsp:forward>
<%
	}
%>
