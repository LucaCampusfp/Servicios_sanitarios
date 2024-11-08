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

		ArrayList<String> preguntas = new ArrayList<String>();
		ArrayList<String> respuestas = new ArrayList<String>();

		String nombreOperador = request.getParameter("operador");
		System.out.println("Este es el operador : " + nombreOperador);
		request.setAttribute("nombreOperador", nombreOperador);
		String nombrePaciente = request.getParameter("nombre_llamante");
		request.setAttribute("nombrePaciente", nombrePaciente);
		String dniPaciente = request.getParameter("dni_llamante");
		request.setAttribute("dniPaciente", dniPaciente);

		/*----------------------------------------------------------------*/

		String pregunta1 = request.getParameter("pregunta1");
		request.setAttribute("pregunta1", pregunta1);
		String pregunta2 = request.getParameter("pregunta2");
		request.setAttribute("pregunta2", pregunta2);
		String pregunta3 = request.getParameter("pregunta3");
		request.setAttribute("pregunta3", pregunta3);

		String respuesta1 = request.getParameter("respuesta1");
		request.setAttribute("respuesta1", respuesta1);

		String respuesta2 = request.getParameter("respuesta2");
		request.setAttribute("respuesta2", respuesta2);

		String respuesta3 = request.getParameter("respuesta3");
		request.setAttribute("respuesta3", respuesta3);


		for (int i = 1; i <= 3; i++) {
			String pregunta = request.getParameter("pregunta" + i);
			String respuesta = request.getParameter("respuesta" + i);
			request.setAttribute("pregunta", pregunta);
			request.setAttribute("respuesta", respuesta);
			preguntas.add(pregunta);
			respuestas.add(respuesta);
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
	
		  int idTrabajador = 0;
		
		    try {
		        idTrabajador = gestionBD.idTrabajador(nombreOperador);  
		        request.setAttribute("idTrabajador", idTrabajador);  
		        System.out.println("ID del Trabajador: " + idTrabajador);
		    } catch (SQLException e) {
		        e.printStackTrace();
		        request.setAttribute("error", "No se pudo obtener el ID del trabajador.");
		    }

		
		
	}

}
