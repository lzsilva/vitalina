<%@page import="java.util.ArrayList"%>
<%@page import="DAO.DAOItinerario"%>
<%@page import="DAO.DAOLinha"%>
<%@page import="DAO.DAOLocalidade"%>
<%@page import="entidade.Itinerario"%>
<%@page import="entidade.Linha"%>
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
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="css/bootstrap.css" />
<link rel="stylesheet" type="text/css"
	href="css/bootstrap-responsive.css" />

<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js"></script>
<script src="js/bootstrap.js"></script>

<title>Deletar Linha</title>
</head>
<body>
	<%	
		DAOLinha daoLinha = new DAOLinha();	
		DAOItinerario daoItinerario = new DAOItinerario();
		Linha linha = daoLinha.buscar(Integer.parseInt(request.getParameter("id")));	
		ArrayList<Itinerario> itinerarios = daoItinerario.buscarPorLinha(linha.getIdLinha());		
	%>

	<script>
		function deletar() {
			if (confirm('Deseja deletar a Linha?')) {	
				document.del.submit();	
			}
		}
	</script>

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
								<li><a href="ListarItinerarios.jsp">Itiner�rio</a></li>
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
				<form name="del" method="post" action="ServLinha">
					<input type="hidden" name="acao" value="deletar" /> <input
						type="hidden" id="id" name="id"
						value="<%= linha.getIdLinha()%>" />
						<h3>Deletar Localidade</h3>
						<p>Voc� ir� deletar as seguintes entidades:</p>
						<p>Localidade: </p>
						<p> <a href="EditLinha.jsp?id=<%= linha.getIdLinha() %>"> <%= linha.getNome() %> </a> </p>
						<% if (itinerarios != null) {%>
							<p>Itinerario(s):</p>
							<% for (Itinerario it: itinerarios){ %>
								<p> <a href="EditItinerario.jsp?id=<%= it.getIdItinerario()%>">Itiner�rio <%= it.getIdItinerario()%> </a></p>
							<%}%>
						<% }%>
						<input class="btn btn-danger" value="Deletar"
						onclick="deletar();">					
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