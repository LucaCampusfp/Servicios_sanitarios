package GestionBD;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class GestionBD {
	private Connection conexion ;

	public GestionBD() {
		// Paso 1: Cargar el driver

		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			String cadenaConexion = "jdbc:mysql://localhost:3306/servicio_medico";
			String user = "root";
			String pass = "curso";
			this.conexion = DriverManager.getConnection(cadenaConexion,user,pass);
			System.out.println("COMPLETADA DE FORMA EXITOSA LA CONEXIÓN A LA BD");
		} catch (ClassNotFoundException | SQLException e) {
			System.out.println("No se ha encontrado el driver para MySQL");
		    e.printStackTrace();
			return;
		}
		

	}

	public Connection getConexion() {
		return this.conexion;
	}
	
	
	public ResultSet obtenerTrabajador() throws SQLException{
		String consultaSQL = "SELECT n_usuario, pass, rol  FROM trabajadores";
		Statement statement = this.conexion.createStatement();
		
		return statement.executeQuery(consultaSQL);
		
	}
}