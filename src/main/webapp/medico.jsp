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
<link rel="stylesheet" href="medico.css">
</head>
<body>
<h1>MEDICO</h1>


<%

		    GestionBD gestionBD = (GestionBD) application.getAttribute("gestionBD");
		    ResultSet rs = gestionBD.medicoLlamadas();
		    
		    
		    ResultSet pacName = gestionBD.llamadasNombre();
		    int numLlamadas = 0;
		    
		    
		    
		    String operador = request.getParameter("operador");
		    String nombreLlamante = request.getParameter("nombre_llamante");
	

		    
		 
%>


<div class="scroll-container">
    <ul>
      


	
	<%
		
		    if (pacName != null) {
		        while (pacName.next()) {
		        
		        	
		        	String nombrePac = pacName.getString("nombre");
                    // Incrementar el número de llamadas
                    numLlamadas++;
		        	%>
		        	
		        	
		        	 <li><a href=""><%= nombrePac %></a></li>
		        	
		        	 <!-- Mostrar el nombre del paciente en la lista -->
		        	
		        	
		        	<%
		           
		        }
		        rs.close();
		    } else {
		        out.println("No se encontraron llamadas.");
		    }
		    //out.println("<p>Número de llamadas: " + numLlamadas + "</p>");
		    
		
	%>
	
		</ul>
	</div>
	
	
	<p> Número de llamadas:   <%=numLlamadas%>  </p>
	
	

	<form action="RegistroLlamadas" method="GET">
        
        <!-- Información Básica de la Llamada -->
        <fieldset>
            <legend>Información de la Llamada</legend>
           
            <label for="nombre_llamante">Nombre de la persona que llama:</label>
            <input type="text" id="nombre_llamante" name="nombre_llamante" required value<%= nombreLlamante %>><br><br>

            <label for="dni_llamante">DNI de la persona que llama:</label>
            <input type="text" id="dni_llamante" name="dni_llamante" required><br><br>
            
        </fieldset>

      
        <button type="submit">Registrar Llamada</button>
    </form>
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

</body>
</html>