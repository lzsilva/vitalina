<%@page import="java.util.ArrayList"%>
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

			<%
				String nome = request.getParameter("nome");
				String tipo = request.getParameter("tipo");
				if (nome == null)
					nome = "";
			%>

			<div class="well">

				<form method="post" action="ListarLocalidades.jsp">
					<h2>Cadastro de Localidade</h2>
					<div class="pull-right">
						<a class="btn btn-primary" href="CadastrarLocalidade.jsp"> <span
							class="icon-plus-sign icon-white"></span>&nbsp; Adicionar
							Localidade
						</a>
					</div>
					<div class="row-fluid">
						<div class="span3">
							<legend>Buscar por nome:</legend>
							<input type="text" value="<%=nome%>" id="nome" name="nome" /><br />
						</div>

						<div class="span3">
							<legend>Filtrar por tipo:</legend>
							<select id="tipo" name="tipo" onchange="this.form.submit()">
								<option
									<%if (tipo != null && tipo.equalsIgnoreCase("defalt")) {%>
									selected <%}%> value="default">Selecione o Tipo</option>
								<option <%if (tipo != null && tipo.equalsIgnoreCase("B")) {%>
									selected <%}%> value="B">Bairro</option>
								<option <%if (tipo != null && tipo.equalsIgnoreCase("L")) {%>
									selected <%}%> value="L">Localidade</option>
							</select><br />
						</div>
					</div>

					<button class="btn btn-success" type="submit" id="busca">
						<span class="icon-search icon-white"></span>&nbsp; Buscar
					</button>
					</fieldset>
				</form>
				<!--------------------------------------------------------FIM FORM-------------------------------------------------->

				<table class="table table-striped" id="tbllocalidade">
					<tr>
						<th style="width: 30px;">ID</th>
						<th>LOCALIDADE</th>
						<th>TIPO</th>
						<th>AÇÃO</th>
						<!-- <th style="width: 50px;">AÇÃO</th> -->
					</tr>

					<%
						ArrayList<Localidade> localidades = new ArrayList<Localidade>();
						DAOLocalidade daoLocalidade = new DAOLocalidade();

						localidades = daoLocalidade.filtrar(nome, tipo);

						for (Localidade x : localidades) {
					%>

					<tr>
						<td><%=x.getIdLocalidade()%></td>
						<td><%=x.getNome()%></td>
						<td><%=x.getTipo()%></td>
						<td><a class="icon-edit"
							href="EditLocalidade.jsp?id=<%=x.getIdLocalidade()%>"
							title="Editar"></a></td>
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