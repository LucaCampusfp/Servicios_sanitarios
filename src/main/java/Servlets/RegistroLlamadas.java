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
 * Servlet implementation class RegistroLlamadas
 */
@WebServlet("/RegistroLlamadas")
public class RegistroLlamadas extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession sesion = request.getSession(false);// No crea sesión si no existe
		
	        
	        if (sesion != null) {
	            String rol = (String) sesion.getAttribute("rol");  // Recupera el rol del trabajador
	            
	            if (rol != null) {
	                // Redirige según el rol
	                switch (rol) {
	                    case "Operador":
	                        RequestDispatcher dispatcher = request.getRequestDispatcher("/RegistroLlamadas");
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

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		ServletContext contextApp = this.getServletContext();
		GestionBD gestionBD = (GestionBD) contextApp.getAttribute("gestionBD");

		ArrayList<String> preguntas = new ArrayList<String>();
		ArrayList<String> respuestas = new ArrayList<String>();

		String nombreOperador = request.getParameter("operador");
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


		for (int i = 0; i <= 3; i++) {
		    // Obtener los parámetros de las preguntas y respuestas
		    String pregunta = request.getParameter("pregunta" + i);
		    String respuesta = request.getParameter("respuesta" + i);

		    // Si la pregunta está vacía o solo tiene espacios, asignar "PENDIENTE"
		    pregunta = (pregunta == null || pregunta.trim().isEmpty()) ? "PENDIENTE" : pregunta.trim();
		    respuesta = (respuesta == null || respuesta.trim().isEmpty()) ? "PENDIENTE" : respuesta.trim();
			request.setAttribute("pregunta" + 1, pregunta);
			request.setAttribute("respuesta"+ 1, respuesta);
		    // Agregar la pregunta y respuesta a las listas
		    preguntas.add(pregunta);
		    respuestas.add(respuesta);
		}

		request.setAttribute("pregunta", preguntas);
		request.setAttribute("respuesta", respuestas);


		/*----------------------------------------------------------------*/

		

		String consejo = request.getParameter("consejo");
		request.setAttribute("consejo", consejo);

		/*-------------------------------------------------------------------------*/

		

		String tipo_derivacion = request.getParameter("tipo_derivacion");
		request.setAttribute("tipo_derivacion", tipo_derivacion);

		/*-------------------------------------------------------------*/

		String llamada_molesta = request.getParameter("llamada_molesta");
		request.setAttribute("llamada_molesta", llamada_molesta);

		/*----------------------------------------------------------------*/
		

		String estado = request.getParameter("estado");
		request.setAttribute("estado", estado);

		/*----------------------------------------------------------------*/

		try {
			int id_paciente = gestionBD.idPaciente(dniPaciente);
			System.out.println(id_paciente);
			if (id_paciente == -1) {
				int id_Trabajador = gestionBD.idTrabajador(nombreOperador.trim());
				gestionBD.nuevoPaciente(nombrePaciente, dniPaciente, id_Trabajador);
				id_paciente = gestionBD.idPaciente(dniPaciente); // Volver a obtener el ID
			}

			int id_Trabajador = gestionBD.idTrabajador(nombreOperador);

			

				if (tipo_derivacion.equals("Médico")) {
					gestionBD.nuevoPaciente(nombrePaciente, dniPaciente, id_Trabajador);
					id_paciente = gestionBD.idPaciente(dniPaciente); // Volver a obtener el ID
					gestionBD.nuevaLLamada(id_paciente, id_Trabajador, consejo, estado, tipo_derivacion);

					int id_llamada = gestionBD.nuevoIdLLamada();

					gestionBD.nuevaPregunta(id_llamada, preguntas, respuestas);

					response.sendRedirect("operador.jsp");

				} else if (tipo_derivacion.equals("Psicologo")) {
					gestionBD.nuevaLLamada(id_paciente, id_Trabajador, consejo, estado, tipo_derivacion);

					int id_llamada = gestionBD.nuevoIdLLamada();

					gestionBD.nuevaPregunta(id_llamada, preguntas, respuestas);

					response.sendRedirect("psicologo.jsp");

				} else if (tipo_derivacion.equals("Enfermera")) {
					gestionBD.nuevaLLamada(id_paciente, id_Trabajador, consejo, estado, tipo_derivacion);

					int id_llamada = gestionBD.nuevoIdLLamada();

					gestionBD.nuevaPregunta(id_llamada, preguntas, respuestas);

					response.sendRedirect("enfermera.jsp");

				}

				System.out.println("Se ha completado y finalizado la consulta");

			


			

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}
	

}
