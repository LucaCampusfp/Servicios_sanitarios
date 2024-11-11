<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.ResultSet, java.sql.SQLException, GestionBD.GestionBD"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
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
        // Obtener los datos de las llamadas desde la base de datos
        GestionBD gestionBD = (GestionBD) application.getAttribute("gestionBD");
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
                        int idLlamada = pacName.getInt("id_llamada");
                        int idPaciente = pacName.getInt("id_paciente");
                        // Capturamos las preguntas y respuestas para una llamada
                        List<String> preguntas = new ArrayList<>();
                        List<String> respuestas = new ArrayList<>();
                        
                        do {
                            String pregunta = pacName.getString("pregunta");
                            String respuesta = pacName.getString("respuesta");

                            // Añadir preguntas y respuestas a las listas
                            preguntas.add(pregunta);
                            respuestas.add(respuesta);
                            
                            //System.out.println(idLlamada);
                        } while (pacName.next() && pacName.getString("nombre").equals(nombrePac) && pacName.getInt("id_llamada") == idLlamada);
						//   } while (pacName.next() && pacName.getString("nombre").equals(nombrePac) && pacName.getInt("id_llamada") == idLlamada);

                        numLlamadas++;

                        // Aquí aseguramos que las preguntas y respuestas se asignen correctamente de tres en tres
                        String pregunta1 = (preguntas.size() > 0) ? preguntas.get(0) : "";
                        String respuesta1 = (respuestas.size() > 0) ? respuestas.get(0) : "";
                        String pregunta2 = (preguntas.size() > 1) ? preguntas.get(1) : "";
                        String respuesta2 = (respuestas.size() > 1) ? respuestas.get(1) : "";
                        String pregunta3 = (preguntas.size() > 2) ? preguntas.get(2) : "";
                        String respuesta3 = (respuestas.size() > 2) ? respuestas.get(2) : "";

            %>

            <!-- Generar un enlace con parámetros para enviar las preguntas y respuestas -->
            <li>
                <a href="medico.jsp?nombre_llamante=<%= nombrePac %>&dni_llamante=<%= dniPac %>&nombreOperador=<%= nombreOp %>
                    <% 
                        // Generar los parámetros de las preguntas y respuestas
                        for (int i = 0; i < preguntas.size(); i++) {
                            out.print("&pregunta" + (i+1) + "=" + preguntas.get(i));
                            out.print("&respuesta" + (i+1) + "=" + respuestas.get(i));
                        }
                    
                    
                    System.out.println( idLlamada + "Y" + idPaciente);
                    %>">
                    <%= nombrePac +  idLlamada + "Y" + idPaciente %>
                    
                     
                    
                </a>
            </li>

            <% 
                    }
                    pacName.close();
                } else {
                    out.println("No se encontraron llamadas.");
                }
            %>
        </ul>
    </div>

    <p> Número de llamadas: <%= numLlamadas %> </p>

    <% 
        // Recuperar los parámetros de la URL (GET)
        String operador = request.getParameter("nombreOperador");
        String nombreLlamante = request.getParameter("nombre_llamante");
        String dniLlamante = request.getParameter("dni_llamante");

        String pregunta1 = request.getParameter("pregunta1");
        String respuesta1 = request.getParameter("respuesta1");
        String pregunta2 = request.getParameter("pregunta2");
        String respuesta2 = request.getParameter("respuesta2");
        String pregunta3 = request.getParameter("pregunta3");
        String respuesta3 = request.getParameter("respuesta3");
        
        String estado = request.getParameter("estado");
        

        // En caso de que alguna pregunta o respuesta esté vacía o nula, asignar valor por defecto
        pregunta1 = (pregunta1 == null || pregunta1.trim().isEmpty()) ? "" : pregunta1;
        respuesta1 = (respuesta1 == null || respuesta1.trim().isEmpty()) ? "" : respuesta1;
        pregunta2 = (pregunta2 == null || pregunta2.trim().isEmpty()) ? "" : pregunta2;
        respuesta2 = (respuesta2 == null || respuesta2.trim().isEmpty()) ? "" : respuesta2;
        pregunta3 = (pregunta3 == null || pregunta3.trim().isEmpty()) ? "" : pregunta3;
        respuesta3 = (respuesta3 == null || respuesta3.trim().isEmpty()) ? "" : respuesta3;
    %>

    <!-- Formulario para registrar la llamada -->
    <form action="ActualizarLlamada" method="POST">
        <!-- Información Básica de la Llamada -->
        <fieldset>
            <legend>Información de la Llamada</legend>
            <label for="operador">Operador que atiende:</label>
            <input type="text" id="operador" name="operador" required value="<%= operador %>"><br><br>

            <label for="nombre_llamante">Nombre de la persona que llama:</label>
            <input type="text" id="nombre_llamante" name="nombre_llamante" value="<%= nombreLlamante %>"><br><br>

            <label for="dni_llamante">DNI de la persona que llama:</label>
            <input type="text" id="dni_llamante" name="dni_llamante" required value="<%= dniLlamante %>"><br><br>
        </fieldset>

        <!-- Preguntas Básicas -->
        <fieldset>
            <legend>Preguntas Básicas</legend>

            <!-- Pregunta 1 y su respuesta -->
            <label for="pregunta1">Pregunta 1:</label>
            <textarea id="pregunta1" name="pregunta1" placeholder="Escribe la pregunta aquí"><%= pregunta1 %></textarea><br><br>

            <label for="respuesta1">Respuesta 1:</label>
            <textarea id="respuesta1" name="respuesta1" placeholder="Escribe la respuesta aquí"><%= respuesta1 %></textarea><br><br>

            <!-- Pregunta 2 y su respuesta -->
            <label for="pregunta2">Pregunta 2:</label>
            <textarea id="pregunta2" name="pregunta2" placeholder="Escribe la pregunta aquí"><%= pregunta2 %></textarea><br><br>

            <label for="respuesta2">Respuesta 2:</label>
            <textarea id="respuesta2" name="respuesta2" placeholder="Escribe la respuesta aquí"><%= respuesta2 %></textarea><br><br>

            <!-- Pregunta 3 y su respuesta -->
            <label for="pregunta3">Pregunta 3:</label>
            <textarea id="pregunta3" name="pregunta3" placeholder="Escribe la pregunta aquí"><%= pregunta3 %></textarea><br><br>

            <label for="respuesta3">Respuesta 3:</label>
            <textarea id="respuesta3" name="respuesta3" placeholder="Escribe la respuesta aquí"><%= respuesta3 %></textarea><br><br>

        </fieldset>
        
        <fieldset>
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
