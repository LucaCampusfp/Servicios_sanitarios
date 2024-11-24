
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.ResultSet, java.sql.SQLException, GestionBD.GestionBD"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Operador</title>
<link rel="stylesheet" href="medico.css">
</head>
<body>
	<% 
        // Obtener los datos de las llamadas desde la base de datos
        GestionBD gestionBD = (GestionBD) application.getAttribute("gestionBD");
        int numLlamadas = 0;
        HttpSession sesion = request.getSession(false);
        String n_usuario = (String) sesion.getAttribute("usuario");
		int id_trabajador = gestionBD.idTrabajador(n_usuario);
		 ResultSet rs = null;
	        try {
	            rs = gestionBD.mostrarInforme(id_trabajador);
	        } catch (SQLException e) {
	            out.println("<h2>Error al obtener los datos: " + e.getMessage() + "</h2>");
	            e.printStackTrace();
	        }
        
    %>
<h1 style="text-align: center;">Panel de gestión de operadores</h1>



<h2>Registro de Llamadas</h2>

 <div class="scroll-container">
<ul style="margin-bottom: 35px">
	<%
		if(rs != null){
			while(rs.next()){
				
				String trabajadorNombre = rs.getString("n_usuario");
				String rol = rs.getString("rol");
				String turno = rs.getString("turno");
				String llamadas_atendidas = rs.getString("llamadas_atendidas");
				String llamadas_derivadas = rs.getString("llamadas_derivadas");
				
				//out.print("&n_usuario=" + trabajadorNombre);
                
	            //out.print("&rol=" + rol);
	                        
	            //out.print("&turno=" + turno);
	            
	        	//out.print("&llamadas_atendidas=" + llamadas_atendidas);
	        	
	        	//out.print("&llamadas_derivadas=" + llamadas_derivadas);
	%>
		<li>
			<p>Nombre : <%= trabajadorNombre %></p>
			<p>Puesto : <%= rol %></p>
			<p>Turno : <%= turno %></p>
			<p>Llamadas Atendidas : <%= llamadas_atendidas %></p>
			<p>llamadas Derivadas : <%= llamadas_derivadas %></p>
			
		
                        	
		
		
		</li>
	<%
		break;
				
			}
			
			
		}
	%>
	
	
	



</ul>
  </div>


    <form action="RegistroLlamadas" method="POST">
        
        <!-- Información Básica de la Llamada -->
        <fieldset>
            <legend>Información de la Llamada</legend>
           
            <label for="operador">Operador que atiende:</label>
            <input type="text" id="operador" name="operador" required value = "<%= n_usuario %>" readonly><br><br>
            
            <label for="nombre_llamante">Nombre de la persona que llama:</label>
            <input type="text" id="nombre_llamante" name="nombre_llamante" required><br><br>

            <label for="dni_llamante">DNI de la persona que llama:</label>
            <input type="text" id="dni_llamante" name="dni_llamante" required><br><br>
        </fieldset>

        <!-- Preguntas Básicas -->
       	<fieldset>
		    <legend>Preguntas Básicas</legend>
		
		    <label for="pregunta1">Pregunta 1:</label>
		    <textarea id="pregunta1" name="pregunta1" placeholder="Escribe la pregunta aquí"></textarea><br><br>
		    <label for="respuesta1">Respuesta 1:</label>
		    <textarea id="respuesta1" name="respuesta1" placeholder="Escribe la respuesta aquí"></textarea><br><br>
		
		    <label for="pregunta2">Pregunta 2:</label>
		    <textarea id="pregunta2" name="pregunta2" placeholder="Escribe la pregunta aquí"></textarea><br><br>
		    <label for="respuesta2">Respuesta 2:</label>
		    <textarea id="respuesta2" name="respuesta2" placeholder="Escribe la respuesta aquí"></textarea><br><br>
		
		    <label for="pregunta3">Pregunta 3:</label>
		    <textarea id="pregunta3" name="pregunta3" placeholder="Escribe la pregunta aquí"></textarea><br><br>
		    <label for="respuesta3">Respuesta 3:</label>
		    <textarea id="respuesta3" name="respuesta3" placeholder="Escribe la respuesta aquí"></textarea><br><br>

		</fieldset>

        <!-- Tipo de Asistencia -->
        <fieldset>
            <label for="consejo">Consejo ofrecido (si aplica):</label>
            <textarea id="consejo" name="consejo"></textarea><br><br>
        </fieldset>

 	   <fieldset>
		    <legend>Registro Final de la Llamada</legend>
		    
		   
		
		    <label for="tipo_derivacion">Tipo de derivación:</label>
		    <select id="tipo_derivacion" name="tipo_derivacion">
		        <option value="ninguno">Ninguno</option>
		        <option value="Médico">Médico</option>
		        <option value="Enfermera">Enfermera</option>
		        <option value="Psicologo">Psicólogo</option>
		    </select><br><br>
		    
		    <label>¿Es una llamada molesta?</label><br>
		    <div class="radio-group">
		        <label for="si_molesta">Sí</label>
		        <input type="radio" id="si_molesta" name="llamada_molesta" value="si" style="margin-right: 50px">
		
		
		        <label for="no_molesta">No</label>
		        <input type="radio" id="no_molesta" name="llamada_molesta" value="no" >
		    </div>
			

            <legend>RESOLUCIÓN FINAL DE LLAMADA</legend>
            <label for="estado">Decisión tomada estado llamada:</label>
            <select id="estado" name="estado" required>
                <option value="PENDIENTE">PENDIENTE</option>
                <option value="FINALIZADA">FINALIZADA</option>
            </select><br><br>
        </fieldset>
        

        <button type="submit">Registrar Llamada</button>
    </form>
     <form action="LogOut" method="post">
    <button type="submit">Cerrar sesión</button>
    </form>
	



</body>
</html>