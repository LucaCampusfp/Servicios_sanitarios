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

import GestionBD.GestionBD;

/**
 * Servlet implementation class Login
 */
@WebServlet("/Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Login() {
        super();
        // TODO Auto-generated constructor stub
    }

	@Override
	public void init() throws ServletException {
		// TODO Auto-generated method stub
		ServletContext contextApp = this.getServletContext();
		GestionBD gestionBD = new GestionBD();
		
		
		contextApp.setAttribute("gestionBD", gestionBD);
		
	}
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

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

		
		String user = request.getParameter("user");
		String pass = request.getParameter("pass");
		
		ServletContext contextApp = this.getServletContext();
		GestionBD gestionBD = (GestionBD) contextApp.getAttribute("gestionBD");
		HttpSession sesion = request.getSession();
		
		
		
		ResultSet rs ;
	
		
		try {
			rs = gestionBD.obtenerTrabajador();

			boolean verificacion = false;
			
			System.out.println(user);
			while(rs.next()) {
				if(user.equals(rs.getString("n_usuario") ) && pass.equals(rs.getString("pass"))) {
					
					verificacion = true;
					break;
				}
			}
			
			if(verificacion == true) {
				 request.setAttribute("successMessage", "Inicio sesión exitoso");
				    sesion.setAttribute("usuario", user);  // Guarda el nombre de usuario o ID
				    sesion.setAttribute("rol", rs.getString("rol"));  // Guarda el rol
				    
				    if(rs.getString("rol").equals("Operador")) {
				        RequestDispatcher dispatcher = request.getRequestDispatcher("operador.jsp");
				        dispatcher.forward(request, response);
				    } else if (rs.getString("rol").equals("Médico")){
				        RequestDispatcher dispatcher = request.getRequestDispatcher("medico.jsp");
				        dispatcher.forward(request, response);
				    } else if (rs.getString("rol").equals("Enfermera")){
				        RequestDispatcher dispatcher = request.getRequestDispatcher("enfermera.jsp");
				        dispatcher.forward(request, response);
				    } else {
				    	RequestDispatcher dispatcher = request.getRequestDispatcher("psicologo.jsp");
				        dispatcher.forward(request, response);
				    }
				

				
			}else {
				request.setAttribute("errorMessage", "Usuario o contraseña incorrectos.");
				RequestDispatcher dispatcher = request.getRequestDispatcher("index.jsp");
				dispatcher.forward(request, response);
				
			}
			
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
	}

}
