
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
<link rel="stylesheet" href="operador.css">
</head>
<body>
	<% 
        // Obtener los datos de las llamadas desde la base de datos
        GestionBD gestionBD = (GestionBD) application.getAttribute("gestionBD");
        int numLlamadas = 0;
		       
        HttpSession sesion = request.getSession(false);
        String n_usuario = (String) sesion.getAttribute("usuario");
       
        
    %>
<h1 style="text-align: center;">Panel de gestión de operadores</h1>

<h2>Registro de Llamadas</h2>
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
			

            <legend>RESOLUCIÓN FINAL DE LLAMADA</legend>
            <label for="estado">Decisión tomada estado llamada:</label>
            <select id="estado" name="estado" required>
                <option value="PENDIENTE">PENDIENTE</option>
                <option value="FINALIZADA">FINALIZADA</option>
            </select><br><br>
        </fieldset>

        <button type="submit">Registrar Llamada</button>
    </form>




</body>
</html>