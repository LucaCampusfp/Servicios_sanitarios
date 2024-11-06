package Servlets;

import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
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

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		ServletContext contextApp = this.getServletContext();
		GestionBD gestionBD = (GestionBD) contextApp.getAttribute("gestionBD");

		ArrayList<String> preguntas = new ArrayList<String>();
		ArrayList<String> respuestas = new ArrayList<String>();

		String nombreOperador = request.getParameter("operador");
		String nombrePaciente = request.getParameter("nombre_llamante");
		String dniPaciente = request.getParameter("dni_llamante");

		/*----------------------------------------------------------------*/

		String pregunta1 = request.getParameter("pregunta1");
		String pregunta2 = request.getParameter("pregunta2");
		String pregunta3 = request.getParameter("pregunta3");

		String respuesta1 = request.getParameter("respuesta1");
		String respuesta2 = request.getParameter("respuesta2");
		String respuesta3 = request.getParameter("respuesta3");

		for (int i = 1; i <= 3; i++) {
			String pregunta = request.getParameter("pregunta" + i);
			String respuesta = request.getParameter("respuesta" + i);
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
		
		
		
		try {
			int id_paciente = gestionBD.idPaciente(dniPaciente);
			System.out.println(id_paciente);
			  if (id_paciente == -1) {
		            int id_Trabajador = gestionBD.idTrabajador(nombreOperador);
		            gestionBD.nuevoPaciente(nombrePaciente, dniPaciente, id_Trabajador);
		            id_paciente = gestionBD.idPaciente(dniPaciente);  // Volver a obtener el ID
		        }

		        int id_Trabajador = gestionBD.idTrabajador(nombreOperador);
			
			
			if (nombreOperador.isBlank() || nombrePaciente.isBlank() || dniPaciente.isBlank() || pregunta1.isBlank()
					|| pregunta2.isBlank() || pregunta3.isBlank() || respuesta1.isBlank() || respuesta2.isBlank()
					|| respuesta3.isBlank() || asistencia == "Dar Consejo" || tipo_derivacion == null|| derivado == null
					|| llamadaMolesta.isBlank()) {
				// Código a ejecutar si alguna de las variables está en blanco

				//System.out.println("Se ha derivado a una llamada pendiente");
				
	
				
				
					
					
					if(tipo_derivacion.equals("Médico")) {
						gestionBD.nuevaLLamada(id_paciente , id_Trabajador, consejo, "PENDIENTE", derivado);
						
						int id_llamada = gestionBD.nuevoIdLLamada();
						
						
						gestionBD.nuevaPregunta(id_llamada, preguntas, respuestas);
						
						response.sendRedirect("medico.jsp");
						
					}else if(tipo_derivacion.equals("Psicologo")) {
						gestionBD.nuevaLLamada(id_paciente , id_Trabajador, consejo, "PENDIENTE", derivado);
						
						int id_llamada = gestionBD.nuevoIdLLamada();
						
						
						gestionBD.nuevaPregunta(id_llamada, preguntas, respuestas);
						
						response.sendRedirect("psicologo.jsp");
						
					}else if(tipo_derivacion.equals("Enfermera")){
						gestionBD.nuevaLLamada(id_paciente , id_Trabajador, consejo, "PENDIENTE", derivado);
						
						int id_llamada = gestionBD.nuevoIdLLamada();
						
						
						gestionBD.nuevaPregunta(id_llamada, preguntas, respuestas);
						
						response.sendRedirect("enfermera.jsp");
						
					}
					
					
					System.out.println("Se ha podido generar perfectamente la llamada pero se ha derivado a pendiente");
				
			} else {
				
				
				if(tipo_derivacion.equals("Médico")) {
					gestionBD.nuevaLLamada(id_paciente , id_Trabajador, consejo, "PENDIENTE", derivado);
					
					int id_llamada = gestionBD.nuevoIdLLamada();
					
					
					gestionBD.nuevaPregunta(id_llamada, preguntas, respuestas);
					
					response.sendRedirect("medico.jsp");
					
				}else if(tipo_derivacion.equals("Psicologo")) {
					gestionBD.nuevaLLamada(id_paciente , id_Trabajador, consejo, "PENDIENTE", derivado);
					
					int id_llamada = gestionBD.nuevoIdLLamada();
					
					
					gestionBD.nuevaPregunta(id_llamada, preguntas, respuestas);
					
					response.sendRedirect("psicologo.jsp");
					
				}else if(tipo_derivacion.equals("Enfermera")){
					gestionBD.nuevaLLamada(id_paciente , id_Trabajador, consejo, "PENDIENTE", derivado);
					
					int id_llamada = gestionBD.nuevoIdLLamada();
					
					
					gestionBD.nuevaPregunta(id_llamada, preguntas, respuestas);
					
					response.sendRedirect("enfermera.jsp");
					
				}
				
				System.out.println("Se ha completado y finalizado la consulta");
				
					gestionBD.nuevaLLamada(id_paciente, id_Trabajador, consejo, "FINALIZADA", derivado);
					
					int id_llamada = gestionBD.nuevoIdLLamada();
					
					
					gestionBD.nuevaPregunta(id_llamada, preguntas, respuestas);
					System.out.println("Se ha podido generar perfectamente la llamada ELSE");
			
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		

		
	}

}
