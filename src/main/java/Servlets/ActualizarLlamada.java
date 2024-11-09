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
import java.sql.ResultSet;
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
        HttpSession sesion = request.getSession(false);
        
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
                    case "Psicologo":
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
            }
        } else {
            response.sendRedirect("index.jsp");  // Si no hay sesión, redirigir al login
        }
    }
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		ServletContext contextApp = this.getServletContext();
		GestionBD gestionBD = (GestionBD) contextApp.getAttribute("gestionBD");
		request.setAttribute("gestionBD", gestionBD);

		ArrayList<String> preguntas = new ArrayList<String>();
		ArrayList<String> respuestas = new ArrayList<String>();

		String nombreOperador = request.getParameter("operador");
		System.out.println("Este es el operador : " + nombreOperador);
	
		String nombrePaciente = request.getParameter("nombre_llamante");

		String dniPaciente = request.getParameter("dni_llamante");


	



		  // Recupera las preguntas y respuestas
        for (int i = 1; i <= 3; i++) {
            preguntas.add(request.getParameter("pregunta" + i));
            respuestas.add(request.getParameter("respuesta" + i));
        }

		/*----------------------------------------------------------------*/

		String asistencia = request.getParameter("asistencia");

		/*-------------------------------------------------------------------------------------*/

		String consejo = request.getParameter("consejo");

		/*-------------------------------------------------------------------------*/

		String derivado = request.getParameter("derivado");

		/*------------------------------------------------------------------------------*/

		String tipo_derivacion = request.getParameter("tipo_derivacion");

		/*-------------------------------------------------------------*/

		String llamadaMolesta = request.getParameter("llamada_molesta");

		/*----------------------------------------------------------------*/ 
		   request.setAttribute("nombreOperador", nombreOperador);
	        request.setAttribute("nombrePaciente", nombrePaciente);
	        request.setAttribute("dniPaciente", dniPaciente);
	        request.setAttribute("preguntas", preguntas);
	        request.setAttribute("respuestas", respuestas);
	        request.setAttribute("asistencia", asistencia);
	        request.setAttribute("consejo", consejo);
	        request.setAttribute("derivado", derivado);
	        request.setAttribute("tipo_derivacion", tipo_derivacion);
	        request.setAttribute("llamadaMolesta", llamadaMolesta);
	
		  		
		    try {
		    	
		    	
		    	int idPaciente = gestionBD.idPaciente(dniPaciente);
		    	System.out.println("Este es el id del paciente número : "+idPaciente);
		        int idTrabajador = gestionBD.idTrabajador(nombreOperador);  
		        
		        int idLlamada = gestionBD.getIdLlamada(idPaciente, idTrabajador);
		        
		        boolean updatePreguntas = gestionBD.updatePreguntas(idLlamada, preguntas, respuestas);
		        
		        if (updatePreguntas) {
		        	
		        	for (int i = 0; i < preguntas.size(); i++) {
		                System.out.println("Pregunta " + (i + 1) + ": " + preguntas.get(i) + " | Respuesta: " + respuestas.get(i));
		            }
	                request.setAttribute("successMessage", "Las preguntas fueron actualizadas correctamente.");
	                
	            } else {
	                request.setAttribute("errorMessage", "No se pudo actualizar las preguntas.");
	            }
		      
		    } catch (SQLException e) {
		        e.printStackTrace();
		        request.setAttribute("error", "No se pudo obtener el ID del trabajador.");
		    }

		
		
	}

}
