package Servlets;

import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Servlet implementation class RegistroLlamadas
 */
@WebServlet("/RegistroLlamadas")
public class RegistroLlamadas extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

		
		
		String nombreOperador = request.getParameter("operador");
		String nombrePaciente = request.getParameter("nombre_llamante");
		String dniPaciente = request.getParameter("dni_llamante");
		
		System.out.println(nombreOperador);
		System.out.println(nombrePaciente);
		System.out.println(dniPaciente);
		
		
		
		
		
		
		
		
		
		
		
		
		
	}

}
