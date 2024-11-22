package Servlets;

import jakarta.servlet.RequestDispatcher;

import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import java.sql.SQLException;
import java.util.ArrayList;

import GestionBD.GestionBD;

/**
 * Servlet implementation class ActualizarLlamada
 */
@WebServlet("/ActualizarLlamada")
public class ActualizarLlamada extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ActualizarLlamada() {
        super();
        // TODO Auto-generated constructor stub
    }
    

	

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Obtén la sesión y verifica si existe
		HttpSession sesion = request.getSession(false);// No crea sesión si no existe
		
        
        if (sesion != null) {
            String rol = (String) sesion.getAttribute("rol");  // Recupera el rol del trabajador
            
            if (rol != null) {
                // Redirige según el rol
                switch (rol) {
                    case "Operador":
                        RequestDispatcher dispatcher = request.getRequestDispatcher("operador.jsp");
                        dispatcher.forward(request, response);
                        break;
                    case "Enfermera":
                        dispatcher = request.getRequestDispatcher("enfermera.jsp");
                        dispatcher.forward(request, response);
                        break;
                    case "Psicólogo":
                        dispatcher = request.getRequestDispatcher("psicologo.jsp");
                        dispatcher.forward(request, response);
                        break;
                    case "Médico":
                        dispatcher = request.getRequestDispatcher("medico.jsp");
                        dispatcher.forward(request, response);
                        break;
                    default:
                        response.sendError(HttpServletResponse.SC_UNAUTHORIZED, "Rol no autorizado");
                        break;
                }
            } else {
                response.sendError(HttpServletResponse.SC_UNAUTHORIZED, "No se ha encontrado rol en la sesión");
                response.sendRedirect("index.jsp");
            }
            
        } else {
            response.sendRedirect("index.jsp");  // Si no hay sesión, redirigir al login
        }
        
    }
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Obtener el contexto y la instancia de la gestión de la base de datos
        ServletContext contextApp = this.getServletContext();
        GestionBD gestionBD = (GestionBD) contextApp.getAttribute("gestionBD");

        ArrayList<String> preguntas = new ArrayList<String>();
        ArrayList<String> respuestas = new ArrayList<String>();

        // Obtener parámetros de la solicitud
        String id_llamada = request.getParameter("id_llamada");
        HttpSession sesion = request.getSession(false); // No crea una nueva sesión si no existe
        request.setAttribute("id_llamada", id_llamada);

        String nombreOperador = request.getParameter("operador");
        System.out.println("Este es el operador : " + nombreOperador);
        request.setAttribute("nombreOperador", nombreOperador);

        String nombrePaciente = request.getParameter("nombre_llamante");
        request.setAttribute("nombrePaciente", nombrePaciente);

        String dniPaciente = request.getParameter("dni_llamante");
        request.setAttribute("dniPaciente", dniPaciente);

        // Recoger las preguntas y respuestas
        for (int i = 1; i <= 3; i++) {
            String pregunta = request.getParameter("pregunta" + i);
            String respuesta = request.getParameter("respuesta" + i);
            
            pregunta = (pregunta == null || pregunta.trim().isEmpty()) ? "PENDIENTE" : pregunta.trim();
            respuesta = (respuesta == null || respuesta.trim().isEmpty()) ? "PENDIENTE" : respuesta.trim();
            
            request.setAttribute("pregunta" + i, pregunta);
            request.setAttribute("respuesta" + i, respuesta);
            
            preguntas.add(pregunta);
            respuestas.add(respuesta);
        }

        request.setAttribute("pregunta", preguntas);
        request.setAttribute("respuesta", respuestas);

        // Obtener otros parámetros
        String estado = request.getParameter("estado");
        request.setAttribute("estado", estado);

        String llamada_molesta = request.getParameter("llamada_molesta");
        request.setAttribute("llamada_molesta", llamada_molesta);

        String consejo = request.getParameter("consejo");
        request.setAttribute("consejo", consejo);

        String tipo_derivacion = request.getParameter("tipo_derivacion");
        request.setAttribute("tipo_derivacion", tipo_derivacion);

        // Procesar la base de datos
        try {
            int idTrabajador = gestionBD.idTrabajador(nombreOperador.trim());
            int idPaciente = gestionBD.idPaciente(dniPaciente);
            
            int idLlamada = gestionBD.getIdLlamadaPendiente(idPaciente, idTrabajador, "PENDIENTE");
            System.out.println(idLlamada);

            int llamadaId = 0;
            try {
                llamadaId = Integer.parseInt(id_llamada);
                System.out.println(llamadaId + " este es el id_llamada");
            } catch (NumberFormatException e) {
                System.out.println("El id_llamada no es un número válido: " + llamadaId);
            }

            int idPreguntas = gestionBD.getIdPregunta(llamadaId);

            if (idPreguntas == -1) { // Si no se encuentran preguntas
                boolean insertPreguntas = gestionBD.nuevaPregunta(llamadaId, preguntas, respuestas);
                if (insertPreguntas) {
                    System.out.println("Preguntas insertadas exitosamente.");
                } else {
                    System.out.println("Error al insertar preguntas.");
                }
            } else {
                boolean updatePreguntasS = gestionBD.actualizarPreguntas(llamadaId, preguntas, respuestas, idPreguntas);
                boolean updateLlamadas = gestionBD.updateLlamada(llamadaId, idPaciente, estado, consejo, "FINALIZADA", llamada_molesta);
                if (updatePreguntasS && updateLlamadas) {
                    String n_usuario = (String) sesion.getAttribute("usuario");
                    int id_trabajador = gestionBD.idTrabajador(n_usuario);
                    gestionBD.LlamadasAtendidas(id_trabajador);
                    System.out.println("Preguntas actualizadas exitosamente y estado paciente.");
                } else {
                    System.out.println("Error al actualizar preguntas.");
                }
            }

            request.setAttribute("idTrabajador", idTrabajador);

        } catch (SQLException e) {
            e.printStackTrace();
            request.setAttribute("error", "No se pudo obtener el ID del trabajador.");
        }

        // Verificar la sesión y el rol
        if (sesion != null) {
            String rol = (String) sesion.getAttribute("rol");  // Recupera el rol del trabajador
            if (rol != null) {
                // Redirigir según el rol
                switch (rol) {
                    case "Operador":
                        RequestDispatcher dispatcher = request.getRequestDispatcher("/RegistroLlamadas");
                        dispatcher.forward(request, response);
                        break;
                    case "Enfermera":
                    	 dispatcher = request.getRequestDispatcher("enfermera.jsp");
                         dispatcher.forward(request, response);
                        break;
                    case "Psicólogo":
                    	 dispatcher = request.getRequestDispatcher("psicologo.jsp");
                         dispatcher.forward(request, response);
                        break;
                    case "Médico":
                     	 dispatcher = request.getRequestDispatcher("medico.jsp");
                         dispatcher.forward(request, response);
                        break;
                    default:
                        response.sendError(HttpServletResponse.SC_UNAUTHORIZED, "Rol no autorizado");
                       
                        break;
                }
            } else {
                response.sendError(HttpServletResponse.SC_UNAUTHORIZED, "No se ha encontrado rol en la sesión");
                response.sendRedirect("index.jsp");
            }
        } else {
            response.sendRedirect("index.jsp");  // Si no hay sesión, redirigir al login
        }
    }

		


}
