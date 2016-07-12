<%@page import="java.util.ArrayList"%>
<%@page import="DAO.DAOEmpresa"%>
<%@page import="entidade.Empresa"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%
	response.setHeader("Cache-Control", "no-cache,no-store,must-revalidate");
	response.setHeader("Pragma", "no-cache");
	response.setDateHeader("Expires", 0);
	if (session.getAttribute("login") != null) {
%>	

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="css/bootstrap.css" />
<link rel="stylesheet" type="text/css"
	href="css/bootstrap-responsive.css" />

<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js"></script>
<script src="js/bootstrap.js"></script>
<script src="js/jquery.validate.js"></script>
<script src="js/valida_forms.js"></script>


<title>Cadastrar Linha</title>
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
				<h2>Cadastrar Linha</h2>
				<form method="post" action="ServLinha" name="linha" id="linha">
					<input type="hidden" name="acao" value="cadastrar" />
					<%
						DAOEmpresa daoEmpresa = new DAOEmpresa();
						ArrayList<Empresa> arrayEmpresa = new ArrayList<Empresa>();
						arrayEmpresa = daoEmpresa.buscar();
					%>
					<select id="empresa" name="empresa">
						<option value="default"><em>Selecione a Empresa</em>
						</option>
						<%
							for (Empresa empresa : arrayEmpresa) {
						%>
						<option value="<%=empresa.getIdEmpresa()%>"><%=empresa.getNome()%></option>
						<%
							}
						%>
					</select><br /> <input placeholder="Nome da Linha" type="text" name="nome" />
					<div>
						<button class="btn btn-primary" type="submit" id="salvar">
							<span class="icon-plus-sign icon-white"></span>&nbsp; Salvar
						</button>
					</div>
				</form>

			</div>
		</div>
	</div>
</body>
</html>

<%
	} else {
%>
<jsp:forward page="Login.jsp"></jsp:forward>
<%
	}
%>