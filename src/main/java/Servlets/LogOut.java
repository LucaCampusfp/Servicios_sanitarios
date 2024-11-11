package Servlets;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

/**
 * Servlet implementation class LogOut
 */
@WebServlet("/LogOut")
public class LogOut extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
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
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		  // Obtén la sesión actual
        HttpSession sesion = request.getSession(false); // No crear sesión si no existe
        if (sesion != null) {
            // Invalida la sesión, lo que elimina todos los atributos
            sesion.invalidate();
        }

        request.setAttribute("message", "Sesión cerrada correctamente.");
        RequestDispatcher dispatcher = request.getRequestDispatcher("index.jsp");
        dispatcher.forward(request, response);
	}

}
