<%@page import="java.util.ArrayList"%>
<%@page import="DAO.DAOLinha"%>
<%@page import="entidade.Linha"%>
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
				String nomeInicial = request.getParameter("nome");
				Integer idEmpresa = null;
				if (nomeInicial == null) {
					nomeInicial = "";
				}
				String empresa = request.getParameter("empresa");
				if (empresa != null && !empresa.equalsIgnoreCase("default")) {
					idEmpresa = Integer.valueOf(request.getParameter("empresa"));
				}
			%>

			<div class="well">

				<h2>Linhas</h2>

				<form method="post" id="formEmpresa" action="ListarLinhas.jsp">
					<div class="pull-right">
						<a class="btn btn-primary" href="CadastrarLinha.jsp"> <span
							class="icon-plus-sign icon-white"></span>&nbsp; Adicionar Linha
						</a>
					</div>
					<div class="row top-buffer"></div>
					<div class="form-group">
						<label>Pesquisar por nome:</label> <input
							style="vertical-align: top" type="text" id="nome" name="nome"
							value="<%=nomeInicial%>" />
						<%
							DAOEmpresa daoEmpresa = new DAOEmpresa();
							ArrayList<Empresa> arrayEmpresa = new ArrayList<Empresa>();
							arrayEmpresa = daoEmpresa.buscar();
						%>
						<select id="empresa" name="empresa" onchange="this.form.submit()">
							<option style="background: rgba(0, 0, 0, 0.3);" value="default">
								<em>Filtrar por Empresa</em>
							</option>
							<%
								for (Empresa emp : arrayEmpresa) {
							%>
							<option
								<%if (idEmpresa != null && emp.getIdEmpresa() == idEmpresa) {%>
								selected <%}%> value="<%=emp.getIdEmpresa()%>"><%=emp.getNome()%></option>
							<%
								}
							%>
						</select><br />
						<button style="vertical-align: top" class="btn btn-success"
							type="submit" id="busca">
							<span class="icon-search icon-white"></span>&nbsp; Buscar
						</button>
					</div>
				</form>
				<!--------------------------------------------------------FIM FORM-------------------------------------------------->

				<table class="table table-striped" id="tbllinha">
					<tr>
						<th style="width: 30px;">ID</th>
						<th>LINHA</th>
						<th>EMPRESA</th>
						<th style="width: 50px;">AÇÃO</th>
					</tr>

					<%
						ArrayList<Linha> linhas = new ArrayList<Linha>();
						DAOLinha daoLinha = new DAOLinha();
						linhas = daoLinha.buscar(nomeInicial, idEmpresa);
						for (Linha x : linhas) {
					%>

					<tr>
						<td><%=x.getIdLinha()%></td>
						<td><%=x.getNome()%></td>
						<td><%=daoEmpresa.buscar(x.getIdEmpresa()).getNome()%></td>
						<td><a class="icon-edit"
							href="EditLinha.jsp?id=<%=x.getIdLinha()%>" title="Editar"></a></td>
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