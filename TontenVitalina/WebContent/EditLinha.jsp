<%@page import="java.util.ArrayList"%>
<%@page import="DAO.DAOEmpresa"%>
<%@page import="DAO.DAOLinha"%>
<%@page import="entidade.Empresa"%>
<%@page import="entidade.Linha"%>
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

<title>Editar Linha</title>
</head>
<body>
	<%
		DAOLinha daoLinha = new DAOLinha();
		Linha linha = daoLinha.buscar(Integer.parseInt(request.getParameter("id")));
		DAOEmpresa daoEmpresa = new DAOEmpresa();
		Empresa empresa = daoEmpresa.buscar(linha.getIdEmpresa());
	%>

	<script>
		function deletar() {
			if (confirm('Deseja deletar a Linha?')) {
	<%//daoEmpresa.deletar(empresa.getIdEmpresa());%>
		window.location = "ListarLinhas.jsp"
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
				<form method="post" action="ServLinha">
					<input type="hidden" name="acao" value="editar" /> <input
						type="hidden" name="id" value="<%=linha.getIdLinha()%>" />
					<table class="table table-striped">
						<tr>
							<th>Id</th>
							<th>Nome Linha</th>
							<th>Empresa</th>
							<th>Ação</th>
						</tr>
						<tr>
							<td><%=linha.getIdLinha()%></td>
							<td><input type="text" value="<%=linha.getNome()%>"
								name="nome" /></td>
							<td>
								<%
									ArrayList<Empresa> arrayEmpresa = new ArrayList<Empresa>();
									arrayEmpresa = daoEmpresa.buscar();
								%> <select id="empresa" name="empresa">
									<%
										for (Empresa emp : arrayEmpresa) {
									%>
									<option <%if (emp.getIdEmpresa() == linha.getIdEmpresa()) {%>
										selected <%}%> value="<%=emp.getIdEmpresa()%>"><%=emp.getNome()%></option>
									<%
										}
									%>
							</select><br />
							</td>
							<td><input type="submit" value="Salvar" /></td>
						</tr>
					</table>
				</form>
			</div>
			<input type="submit" class="btn btn-danger" value="Deletar"
				onclick="deletar();">
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