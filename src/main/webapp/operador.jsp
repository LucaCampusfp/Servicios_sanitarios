<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Operador</title>
<link rel="stylesheet" href="operador.css">
</head>
<body>
<h1 style="text-align: center;">Panel de gestión de operadores</h1>

<h2>Registro de Llamadas</h2>
    <form action="/guardar" method="POST">
        
        <!-- Información Básica de la Llamada -->
        <fieldset>
            <legend>Información de la Llamada</legend>
           
            <label for="operador">Operador que atiende:</label>
            <input type="text" id="operador" name="operador" required><br><br>
            
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
            <legend>Tipo de Asistencia</legend>
            <label for="asistencia">Decisión tomada:</label>
            <select id="asistencia" name="asistencia" required>
                <option value="consejo">Dar consejo</option>
                <option value="medico">Derivar a médico</option>
                <option value="enfermera">Derivar a enfermera</option>
                <option value="psicologo">Derivar a psicólogo</option>
                <option value="llamada_molesta">Registrar como llamada molesta</option>
            </select><br><br>

            <label for="consejo">Consejo ofrecido (si aplica):</label>
            <textarea id="consejo" name="consejo"></textarea><br><br>
        </fieldset>

 	   <fieldset>
		    <legend>Registro Final de la Llamada</legend>
		    
		    <label>¿Fue derivado a un profesional?</label><br>
		    <div class="radio-group">
		        <label for="si_derivado">Sí</label>
		        <input type="radio" id="si_derivado" name="derivado" value="si" style="margin-right: 50px">
		  
		        <label for="no_derivado">No</label>
		        <input type="radio" id="no_derivado" name="derivado" value="no">
		    </div>
		
		    <label for="tipo_derivacion">Tipo de derivación:</label>
		    <select id="tipo_derivacion" name="tipo_derivacion">
		        <option value="ninguno">Ninguno</option>
		        <option value="medico">Médico</option>
		        <option value="enfermera">Enfermera</option>
		        <option value="psicologo">Psicólogo</option>
		    </select><br><br>
		
		    <label>¿Es una llamada molesta?</label><br>
		    <div class="radio-group">
		        <label for="si_molesta">Sí</label>
		        <input type="radio" id="si_molesta" name="llamada_molesta" value="si" style="margin-right: 50px">
		
		
		        <label for="no_molesta">No</label>
		        <input type="radio" id="no_molesta" name="llamada_molesta" value="no" checked>
		    </div>
		</fieldset>

        <button type="submit">Registrar Llamada</button>
    </form>




</body>
</html>