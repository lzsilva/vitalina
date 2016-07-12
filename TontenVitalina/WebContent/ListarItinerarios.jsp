<%@page import="java.lang.reflect.Array"%>
<%@page import="DAO.DAOLinha"%>
<%@page import="entidade.Linha"%>
<%@page import="DAO.DAOLocalidade"%>
<%@page import="entidade.Localidade"%>
<%@page import="java.util.ArrayList"%>
<%@page import="DAO.DAOItinerario"%>
<%@page import="entidade.Itinerario"%>
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
<script src="js/CadItinerario.js"></script>
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

				<form method="post" action="ListarItinerarios.jsp"
					id="formItinerario">

					<h2>Listagem de Itinerario</h2>

					<%
						Integer idLinha = null, idLocalidade = null;
						String linha = request.getParameter("linha");
						String localidade = request.getParameter("localidade");
						if (linha != null && !linha.equalsIgnoreCase("default"))
							idLinha = Integer.valueOf(linha);
						if (localidade != null && !localidade.equalsIgnoreCase("default"))
							idLocalidade = Integer.valueOf(localidade);

						DAOLinha daoLinha = new DAOLinha();
						ArrayList<Linha> arrayLinha = new ArrayList<Linha>();
						arrayLinha = daoLinha.buscar();
					%>

					<div class="pull-right">
						<a class="btn btn-primary" href="CadastrarItinerario.jsp"> <span
							class="icon-plus-sign icon-white"></span>&nbsp; Adicionar
							Itinerario
						</a>
					</div>

					<div class="row-fluid">

						<div class="span3">
							<label>Filtrar por Linha:</label> <select id="linha" name="linha"
								onchange="this.form.submit()">
								<option value="default">Selecione a Linha</option>
								<%
									for (Linha l : arrayLinha) {
								%>
								<option <%if (idLinha != null && idLinha == l.getIdLinha()) {%>
									selected <%}%> value="<%=l.getIdLinha()%>"><%=l.getNome()%></option>
								<%
									}
								%>
							</select><br />
						</div>

						<%
							DAOLocalidade daoLocalidade = new DAOLocalidade();
							ArrayList<Localidade> arrayLocalidade = new ArrayList<Localidade>();
							arrayLocalidade = daoLocalidade.buscar();
						%>
						<div class="span3">
							<label>Filtrar por Localidade:</label> <select id="localidade"
								name="localidade" onchange="this.form.submit()">
								<option value="default">Selecione a Localidade</option>
								<%
									for (Localidade local : arrayLocalidade) {
								%>
								<option
									<%if (idLocalidade != null && idLocalidade == local.getIdLocalidade()) {%>
									selected <%}%> value="<%=local.getIdLocalidade()%>">
									<%=local.getNome()%></option>
								<%
									}
								%>
							</select><br />

						</div>
					</div>
				</form>
				<!--------------------------------------------------------FIM FORM-------------------------------------------------->

				<table class="table table-striped" id="tblitinerario">
					<tr>
						<th>LINHA</th>
						<th>LOCALIDADE</th>
						<th>ORDEM</th>
						<th>AÇÃO</th>
					</tr>

					<%
						ArrayList<Itinerario> itinerarios = new ArrayList<Itinerario>();
						DAOItinerario daoItinerario = new DAOItinerario();
						itinerarios = daoItinerario.filtrar(idLinha, idLocalidade);

						for (Itinerario x : itinerarios) {
					%>

					<tr>

						<td><%=daoLinha.buscar(x.getIdLinha()).getNome()%></td>
						<td><%=daoLocalidade.buscar(x.getIdLocalidade()).getNome()%></td>
						<td><%=x.getOrdem()%></td>
						<td><a class="icon-edit"
							href="EditItinerario.jsp?id=<%=x.getIdItinerario()%>"
							href="EditEmpresa.jsp?id="></a></td>
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