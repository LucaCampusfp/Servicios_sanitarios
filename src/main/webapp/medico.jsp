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
		    
		    
		    
		  

		    
		 
%>


<div class="scroll-container">
    <ul>
      


	
	<%
		
		    if (pacName != null) {
		        while (pacName.next()) {
		        
		        	String nombreOp = pacName.getString("nombreOperador");
		        	String nombrePac = pacName.getString("nombre");
		        	String dniPac = pacName.getString("dni");
                    // Incrementar el número de llamadas
                    numLlamadas++;
		        	%>
		        	
		        	
		       		<li><a href="medico.jsp?nombre_llamante=<%= nombrePac %>&dni_llamante=<%= dniPac %>&nombreOperador=<%= nombreOp %>"><%= nombrePac %></a></li>
		        	
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
	<% 
    // Recuperamos el parámetro 'nombre_llamante' de la URL (GET)
	  	String operador = request.getParameter("nombreOperador");
	    String nombreLlamante = request.getParameter("nombre_llamante");
		String dniLlamante = request.getParameter("dni_llamante");
		
	  
	   
	    
	    String pregunta1 = request.getParameter("pregunta1");
	    String respuesta1 = request.getParameter("respuesta1");
	    String pregunta2 = request.getParameter("pregunta2");
	    String respuesta2 = request.getParameter("respuesta2");
	    String pregunta3 = request.getParameter("pregunta3");
	    String respuesta3 = request.getParameter("respuesta3");
	    
	    String asistencia = request.getParameter("asistencia");
	    String consejo = request.getParameter("consejo");

	    String derivado = request.getParameter("derivado");
	    String tipoDerivacion = request.getParameter("tipo_derivacion");
	    String llamadaMolesta = request.getParameter("llamada_molesta");
	%>
	

	<form action="RegistroLlamadas" method="GET">
        
        <!-- Información Básica de la Llamada -->
        <fieldset>
            <legend>Información de la Llamada</legend>
            
            
             <label for="operador">Operador que atiende:</label>
            <input type="text" id="operador" name="operador" required value="<%= operador %>"><br><br>
           
            <label for="nombre_llamante">Nombre de la persona que llama:</label>
            <input type="text" id="nombre_llamante" name="nombre_llamante"value="<%= nombreLlamante %>"><br><br>

            <label for="dni_llamante">DNI de la persona que llama:</label>
            <input type="text" id="dni_llamante" name="dni_llamante" required value="<%= dniLlamante %>"><br><br>
            
        </fieldset>

      
        <button type="submit">Registrar Llamada</button>
        
    </form>
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

</body>
</html>