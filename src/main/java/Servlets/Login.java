package Servlets;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.beans.Statement;
import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;

import Clases.Trabajador;
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
		 RequestDispatcher dispatcher = request.getRequestDispatcher("/index.jsp");
	        dispatcher.forward(request, response);
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
		
		ResultSet rs ;
	
		
		try {
			rs = gestionBD.obtenerTrabajador();
			System.out.println("adios");
			boolean verificacion = false;
			
			System.out.println(user);
			while(rs.next()) {
				if(user.equals(rs.getString("n_usuario") ) && pass.equals(rs.getString("pass"))) {
					System.out.println("Hola");
					verificacion = true;
					break;
				}
			}
			
			if(verificacion == true) {
				request.setAttribute("successMessage", "Inicio sesión exitoso");
				RequestDispatcher dispatcher = request.getRequestDispatcher("index.jsp");
				dispatcher.forward(request, response);
				
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
