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
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<link rel="stylesheet" type="text/css" href="css/bootstrap.css" />
<link rel="stylesheet" type="text/css"
	href="css/bootstrap-responsive.css" />

<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js"></script>
<script src="js/bootstrap.js"></script>
<script src="js/jquery.validate.js"></script>
<script src="js/CadEmpresa.js"></script>
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
			<!--------------------------------------------------------FIM MENU-------------------------------------------------->
			<%
				String buscaInicial = request.getParameter("buscar");
				if (buscaInicial == null) {
					buscaInicial = "";
				}
			%>
			<div class="well">

				<h2>Empresas</h2>
				<div class="control-group">
					<a class="btn btn-primary" href="CadastrarEmpresa.jsp"> <span
						class="icon-plus-sign icon-white"></span>&nbsp; Adicionar Empresa
					</a>
				</div>
				<div class="form-group">
					<form method="post" action="ListarEmpresas.jsp">
						<label>Pesquisar por nome:</label> <input
							style="vertical-align: top" type="text" / name="buscar"
							value="<%=buscaInicial%>">
						<button class="btn btn-success" style="vertical-align: top"
							type="submit">
							<span class="icon-search icon-white"></span>&nbsp; Buscar
						</button>
					</form>
				</div>
				<!--------------------------------------------------------FIM FORM-------------------------------------------------->

				<table class="table table-striped" id="tblempresa">
					<tr>
						<th style="width: 30px;">Id</th>
						<th>Nome</th>
						<th style="width: 50px;">Editar</th>
					</tr>

					<%
						ArrayList<Empresa> empresas = new ArrayList<Empresa>();
						DAOEmpresa daoEmpresa = new DAOEmpresa();

						empresas = daoEmpresa.buscar(request.getParameter("buscar"));

						for (Empresa x : empresas) {
					%>

					<tr>
						<td><%=x.getIdEmpresa()%></td>
						<td><%=x.getNome()%></td>
						<td><a class="icon-edit"
							href="EditEmpresa.jsp?id=<%=x.getIdEmpresa()%>" title="Editar"></a></td>
					</tr>

					<%
						}
					%>
				</table>
				<!--------------------------------------------------------FIM TABLE-------------------------------------------------->
			</div>
			<!--fim well-->

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