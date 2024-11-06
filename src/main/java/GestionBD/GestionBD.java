package GestionBD;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class GestionBD {
	private Connection conexion;

	public GestionBD() {
		// Paso 1: Cargar el driver

		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			String cadenaConexion = "jdbc:mysql://localhost:3306/servicio_medico";
			String user = "root";
			String pass = "curso";
			this.conexion = DriverManager.getConnection(cadenaConexion, user, pass);
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

	public ResultSet obtenerTrabajador() throws SQLException {
		String consultaSQL = "SELECT n_usuario, pass, rol  FROM trabajadores";
		Statement statement = this.conexion.createStatement();

		return statement.executeQuery(consultaSQL);

	}

	public boolean nuevaLLamada(int idPaciente, int idTrabajador, String consejo, String estado,
			String tipoEspecialista) throws SQLException {
		String insertSQL = "INSERT INTO llamada (id_paciente, id_trabajador, consejo, estado, tipo_especialista) VALUES (?, ?, ?, ?, ?)";
		try (PreparedStatement statement = this.conexion.prepareStatement(insertSQL)) {
			statement.setInt(1, idPaciente);
			statement.setInt(2, idTrabajador);
			statement.setString(3, consejo);
			statement.setString(4, estado);
			statement.setString(5, tipoEspecialista);

			int rowsInserted = statement.executeUpdate();
			
			//Se utiliza para verificar si al menos una fila se ha insertado con éxito
			return rowsInserted > 0;
		} catch (SQLException e) {
			System.out.println("Error con la creación de la llamada: " + e.getMessage());
			throw e;
		}
	}
	public boolean nuevaPregunta(int idLlamada, ArrayList<String> preguntas, ArrayList<String> respuestas) throws SQLException {
		String insertSQL = "INSERT INTO preguntas (id_llamada, pregunta, respuesta) VALUES (?, ?, ?)";
	    try (PreparedStatement statement = this.conexion.prepareStatement(insertSQL)) {
	        for (int i = 0; i < preguntas.size(); i++) {
	            statement.setInt(1, idLlamada);
	            statement.setString(2, preguntas.get(i) != null ? preguntas.get(i) : null); 
	            statement.setString(3, respuestas.get(i) != null ? respuestas.get(i) : null); 
	            
	            statement.addBatch(); 
	        }

	        int[] rowsInserted = statement.executeBatch(); 
	        return rowsInserted.length > 0;
		} catch (SQLException e) {
			System.out.println("Error con la inserción de preguntas: " + e.getMessage());
			throw e;
		}
	}
	
	public boolean nuevoPaciente(String nombre, String dni, int idTrabajador) throws SQLException {
	    String insertSQL = "INSERT INTO paciente (nombre, dni, id_trabajador) VALUES (?, ?, ?)";
	    try (PreparedStatement statement = this.conexion.prepareStatement(insertSQL)) {
	        statement.setString(1, nombre);
	        statement.setString(2, dni);
	       
	        statement.setInt(3, idTrabajador);
	        
	        
	        int rowsInserted = statement.executeUpdate(); // Ejecuta la inserción
	        return rowsInserted > 0; // Retorna true si se insertó exitosamente
	    } catch (SQLException e) {
	        System.out.println("Error al insertar el paciente: " + e.getMessage());
	        throw e;
	    }
	}

	
	
	
	public int nuevoIdLLamada() throws SQLException {
	    String query = "SELECT LAST_INSERT_ID()";
	    try (Statement statement = this.conexion.createStatement();
	         ResultSet rs = statement.executeQuery(query)) {
	        if (rs.next()) {
	            return rs.getInt(1);
	        } else {
	            throw new SQLException("No se pudo obtener el último ID de llamada.");
	        }
	    }
	}
	public int idPaciente(String dni) throws SQLException {
	    String query = "SELECT id_paciente FROM paciente WHERE dni = ?";
	    try (PreparedStatement statement = this.conexion.prepareStatement(query)) {
	        statement.setString(1, dni);
	        ResultSet rs = statement.executeQuery();
	        if (rs.next()) {
	            return rs.getInt("id_paciente");
	        } else {
	            throw new SQLException("No se encontró el paciente con DNI: " + dni);
	        }
	    }
	}

	public int idTrabajador(String nombre) throws SQLException {
	    String query = "SELECT id_user FROM trabajadores WHERE n_usuario = ?";
	    try (PreparedStatement statement = this.conexion.prepareStatement(query)) {
	        statement.setString(1, nombre);
	        ResultSet rs = statement.executeQuery();
	        if (rs.next()) {
	            return rs.getInt("id_user");
	        } else {
	            throw new SQLException("No se encontró el operador con nombre: " + nombre);
	        }
	    }
	}

}