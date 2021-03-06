<%@page import="entidade.ObjetoDeTransporte"%>
<%@page import="java.util.ArrayList"%>
<%@page import="DAO.DAOLocalidade"%>
<%@page import="entidade.Localidade"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%	
	if (session.getAttribute("login") != null) {
		session.invalidate();
	}
%>
 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">

	<link rel="stylesheet" type="text/css" href="css/bootstrap.css" />
	<link rel="stylesheet" type="text/css" href="css/bootstrap-responsive.css" />
	
	<script  src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js"></script>  
    <script  src="js/bootstrap.js"></script>
    
     <style type="text/css">
      body {
        padding-top: 20px;
        padding-bottom: 60px;
        background: #fff;
      }

      /* Custom container */
      .container {
        margin: 0 auto;
        max-width: 1000px;
      }
      .container > hr {
        margin: 60px 0;
      }

      /* Main marketing message and sign up button */
      .jumbotron {
        margin: 80px 0;
        text-align: center;
      }
      .jumbotron h1 {
        font-size: 100px;
        line-height: 1;
      }
      .jumbotron .lead {
        font-size: 24px;
        line-height: 1.25;
      }
      .jumbotron .btn {
        font-size: 21px;
        padding: 14px 24px;
      }

      /* Supporting marketing content */
      .marketing {
        margin: 60px 0;
      }
      .marketing p + h4 {
        margin-top: 28px;
      }


      /* Customize the navbar links to be fill the entire space of the .navbar */
      .navbar .navbar-inner {
        padding-left: 10;
      }
      .navbar .nav {
        margin: 0;
        display: table;
        width: 100%;
      }
      .navbar .nav li {
        display: table-cell;
        width: 1%;
        float: none;
      }
      .navbar .nav li a {
        font-weight: bold;
        text-align: center;
        border-left: 1px solid rgba(255,255,255,.75);
        border-right: 1px solid rgba(0,0,0,.1);
      }
      .navbar .nav li:first-child a {
        border-left: 0;
        border-radius: 3px 0 0 3px;
      }
      .navbar .nav li:last-child a {
        border-right: 0;
        border-radius: 0 3px 3px 0;
      }
    </style>
    
    <script language = "javascript" type = "text/javascript" >
		function funcao(){		
		
		document.frm.submit();	
		
		}		
		
	</script>

<title>ESCOLHER LINHAS:</title>
</head>
	<body>

		<div class="container">

      		<div class="navbar">
				<div class="navbar-inner">
					<a class="brand" href="#">Toten de Vitalina</a>
				</div>
			</div><!--fim navbar-->

      	<!-- Jumbotron -->
      	<div class="well">
          
          	<legend>Ponto de Partida</legend>
         
         	<form name ="frm"  method = "post" action="ListarLinhas">
          
          		<select name="partida" id="23">
            		<option value ="0">Escolha a origem:</option> 
             		<%
            		DAOLocalidade dl = new DAOLocalidade();
            		ArrayList<Localidade> localidades = dl.buscar();
            		for(Localidade l: localidades){            
            		%>
            		<option  value=<%=Integer.toString(l.getIdLocalidade())%> > <%=l.getNome()%>(<%=l.getTipo()%>) </option>                       
          			<%} %>
          		</select><br /><br />
          
          		<legend>Ponto de Chegada</legend>
          		<select name="chegada" id="25">
            		<option value ="0">Escolha o ponto de chegada...</option>
            		<%
            		for(Localidade l2: localidades){                       
            		%>
            		<option  value=<%=Integer.toString(l2.getIdLocalidade())%> > <%=l2.getNome()%>(<%=l2.getTipo()%>) </option>                       
          			<%} %>
            
          		</select><br /><br>
          		
          		<a onclick = "funcao()"  role="button" class="btn btn-large btn-success" >Pesquisar</a>          		
          
         	</form>           	
         	
         	

      </div>
      <hr>
      <h3 class="pull-right"><small>Toten de Vitalina - SI-IFMA Vers�o 1.0</small></h3>
    </div> <!-- /container -->	

</body>
</html>