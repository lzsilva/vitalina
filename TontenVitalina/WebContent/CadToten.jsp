<%@page import="java.util.ArrayList"%>
<%@page import="DAO.DAOToten"%>
<%@page import="entidade.Toten"%>
<%@page import="DAO.DAOLocalidade"%>
<%@page import="entidade.Localidade"%>
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

			<div class="well">

				<form method="post" action="CadastrarToten">
					<fieldset>
						<legend>Cadastro de Toten</legend>

						<input type="text" placeholder="nome do toten" name="nome"
							id="nome" /><br />

						<%
							DAOLocalidade daoLocalidade = new DAOLocalidade();
							ArrayList<Localidade> arrayLocalidade = new ArrayList<Localidade>();
							arrayLocalidade = daoLocalidade.buscar();
						%>


						<select id="localidade" name="localidade">
							<%
								for (Localidade localidade : arrayLocalidade) {
							%>
							<option value="<%=localidade.getIdLocalidade()%>"><%=localidade.getNome()%></option>
							<%
								}
							%>
						</select><br />


						<button class="btn btn-primary" type="submit" id="salvar">
							<span class="icon-plus-sign icon-white"></span>&nbsp; Salvar
						</button>
						<button class="btn btn-success" type="submit" id="busca"
							formaction="BuscarToten">
							<span class="icon-search icon-white"></span>&nbsp; Buscar
						</button>
					</fieldset>
				</form>
				<!--------------------------------------------------------FIM FORM-------------------------------------------------->

				<table class="table table-striped" id="tbltoten">
					<tr>
						<th style="width: 30px;">ID</th>
						<th>LOCALIDADE</th>
						<!-- <th style="width: 50px;">AÇÃO</th> -->
					</tr>

					<%
						ArrayList<Toten> totens = new ArrayList<Toten>();
						DAOToten daoToten = new DAOToten();

						totens = daoToten.buscar();

						for (Toten x : totens) {
					%>

					<tr>
						<td><%=x.getIdToten()%></td>
						<td><%=x.getIdLocalidade()%></td>
						<!-- <td><a href="EditEmpresa.jsp?id=">Edit</a></td> -->
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