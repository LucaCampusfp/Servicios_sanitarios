<%@page import="GestionBD.GestionBD"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>

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

            // Capturamos las preguntas y respuestas para una llamada
            List<String> preguntas = new ArrayList<>();
            List<String> respuestas = new ArrayList<>();
            
            do {
                String pregunta = pacName.getString("pregunta");
                String respuesta = pacName.getString("respuesta");

                
                    preguntas.add(pregunta);
                    respuestas.add(respuesta);
                
            } while (pacName.next() && pacName.getString("nombre").equals(nombrePac));

            numLlamadas++;
%>

            <!-- Generar un enlace con parámetros para enviar las preguntas y respuestas -->
            <li>
                <a href="medico.jsp?nombre_llamante=<%= nombrePac %>&dni_llamante=<%= dniPac %>&nombreOperador=<%= nombreOp %>
                <% 
                    for (int i = 0; i < preguntas.size(); i++) {
                        out.print("&pregunta" + (i+1) + "=" + preguntas.get(i));
                        out.print("&respuesta" + (i+1) + "=" + respuestas.get(i));
                    }
                %>">
                <%= nombrePac %> 
                </a>
            </li>

<%
        }
        rs.close();
    } else {
        out.println("No se encontraron llamadas.");
    }
%>
	
		</ul>
	</div>
	
	
	<p> Número de llamadas:   <%=numLlamadas%>  </p>
<% 
    // Recuperamos los parámetros de la URL (GET) solo si existen
    String operador = request.getParameter("nombreOperador") != null ? request.getParameter("nombreOperador") : "";
    String nombreLlamante = request.getParameter("nombre_llamante") != null ? request.getParameter("nombre_llamante") : "";
    String dniLlamante = request.getParameter("dni_llamante") != null ? request.getParameter("dni_llamante") : "";

    String pregunta1 = request.getParameter("pregunta1") != null ? request.getParameter("pregunta1") : "";
    String respuesta1 = request.getParameter("respuesta1") != null ? request.getParameter("respuesta1") : "";
    String pregunta2 = request.getParameter("pregunta2") != null ? request.getParameter("pregunta2") : "";
    String respuesta2 = request.getParameter("respuesta2") != null ? request.getParameter("respuesta2") : "";
    String pregunta3 = request.getParameter("pregunta3") != null ? request.getParameter("pregunta3") : "";
    String respuesta3 = request.getParameter("respuesta3") != null ? request.getParameter("respuesta3") : "";
%>

<form action="ActualizarLlamada" method="POST">
    <!-- Información Básica de la Llamada -->
    <fieldset>
        <legend>Información de la Llamada</legend>
        <label for="operador">Operador que atiende:</label>
        <input type="text" id="operador" name="operador"  required value="<%= operador %>"><br><br>
        
        <label for="nombre_llamante">Nombre de la persona que llama:</label>
        <input type="text" id="nombre_llamante" name="nombre_llamante" value="<%= nombreLlamante %>"><br><br>

        <label for="dni_llamante">DNI de la persona que llama:</label>
        <input type="text" id="dni_llamante" name="dni_llamante" required value="<%= dniLlamante %>"><br><br>
    </fieldset>
    
    <!-- Preguntas Básicas -->
    <fieldset>
        <legend>Preguntas Básicas</legend>

        <label for="pregunta1">Pregunta 1:</label>
        <textarea id="pregunta1" name="pregunta1" placeholder="Escribe la pregunta aquí"><%= pregunta1 %></textarea><br><br>
        
        <label for="respuesta1">Respuesta 1:</label>
        <textarea id="respuesta1" name="respuesta1" placeholder="Escribe la respuesta aquí"><%= respuesta1 %></textarea><br><br>

        <label for="pregunta2">Pregunta 2:</label>
        <textarea id="pregunta2" name="pregunta2" placeholder="Escribe la pregunta aquí"><%= pregunta2 %></textarea><br><br>

        <label for="respuesta2">Respuesta 2:</label>
        <textarea id="respuesta2" name="respuesta2" placeholder="Escribe la respuesta aquí"><%= respuesta2 %></textarea><br><br>

        <label for="pregunta3">Pregunta 3:</label>
        <textarea id="pregunta3" name="pregunta3" placeholder="Escribe la pregunta aquí"><%= pregunta3 %></textarea><br><br>

        <label for="respuesta3">Respuesta 3:</label>
        <textarea id="respuesta3" name="respuesta3" placeholder="Escribe la respuesta aquí"><%= respuesta3 %></textarea><br><br>
    </fieldset>
    
    <button type="submit">Actualizar Llamada</button>
</form>

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

</body>
</html>