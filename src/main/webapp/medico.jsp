<%@page import="GestionBD.GestionBD"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page
	import="java.sql.ResultSet, java.sql.SQLException, GestionBD.GestionBD"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Medico</title>
</head>
<body>
<h1>MEDICO</h1>
	<%

		    GestionBD gestionBD = (GestionBD) application.getAttribute("gestionBD");
		    ResultSet rs = gestionBD.medicoLlamadas();
		    int numLlamadas = 0;
		
		    if (rs != null) {
		        while (rs.next()) {
		            numLlamadas++;
		        }
		        rs.close();
		    } else {
		        out.println("No se encontraron llamadas.");
		    }
		    out.println("<p>Número de llamadas: " + numLlamadas + "</p>");
		
	%>

</body>
</html>