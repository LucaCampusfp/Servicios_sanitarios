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
	

	public ResultSet medicoLlamadas() throws SQLException {
		String consultaSQL = "SELECT * FROM llamada WHERE id_trabajador = 3 AND estado = 'FINALIZADA'";
		Statement statement = this.conexion.createStatement();

		return statement.executeQuery(consultaSQL);

	}
	
	public ResultSet llamadasNombre() throws SQLException{
		
		String consultaSQL =
				  "SELECT DISTINCT t.n_usuario AS nombreOperador, p.nombre AS nombre, p.dni, " +
					        "q.pregunta, q.respuesta, l.id_llamada " +
					        "FROM paciente p " +
					        "JOIN llamada l ON p.id_paciente = l.id_paciente " +
					        "JOIN trabajadores t ON l.id_trabajador = t.id_user " +
					        "LEFT JOIN preguntas q ON l.id_llamada = q.id_llamada WHERE l.estado = 'PENDIENTE'; "
					        
					        ;
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
	
	public int getIdLlamada(int idPaciente, int idTrabajador) throws SQLException {
	    String query = "SELECT id_llamada FROM llamada WHERE id_paciente = ? AND id_trabajador = ? ";
	    try (PreparedStatement statement = this.conexion.prepareStatement(query)) {
	        statement.setInt(1, idPaciente);
	        statement.setInt(2, idTrabajador);

	        ResultSet rs = statement.executeQuery();
	        if (rs.next()) {
	            return rs.getInt("id_llamada");
	        } else {
	            return -1; // Si no encontramos la llamada, devolvemos -1
	        }
	    }
	}

	
	
	
	public boolean updateLlamada(int idLlamada, int idPaciente, int idTrabajador, String consejo, String estado, String tipoEspecialista) throws SQLException {
	    // SQL de actualización
	    String updateSQL = "UPDATE llamada SET id_paciente = ?, id_trabajador = ?, consejo = ?, estado = ?, tipo_especialista = ? WHERE id_llamada = ?";
	    
	    try (PreparedStatement statement = this.conexion.prepareStatement(updateSQL)) {
	        // Establecer los parámetros en el PreparedStatement
	        statement.setInt(1, idPaciente);
	        statement.setInt(2, idTrabajador);
	        statement.setString(3, consejo);
	        statement.setString(4, estado);
	        statement.setString(5, tipoEspecialista);
	        statement.setInt(6, idLlamada); // Asegúrate de identificar la llamada por su ID

	        // Ejecutar la actualización y verificar cuántas filas fueron afectadas
	        int rowsUpdated = statement.executeUpdate();
	        
	        // Retornar true si se actualizó al menos una fila, de lo contrario, false
	        return rowsUpdated > 0;
	    } catch (SQLException e) {
	        System.out.println("Error con la actualización de la llamada: " + e.getMessage());
	        throw e;
	    }
	}
	public boolean actualizarPregunta(int idLlamada, ArrayList<String> preguntas, ArrayList<String> respuestas) throws SQLException {
	    String updateSQL = "UPDATE preguntas SET respuesta = ? WHERE id_llamada = ? AND pregunta = ?";
	    try (PreparedStatement statement = this.conexion.prepareStatement(updateSQL)) {
	        for (int i = 0; i < preguntas.size(); i++) {
	            // Verificar que la pregunta y la respuesta no sean nulas
	            if (preguntas.get(i) != null && respuestas.get(i) != null) {
	                statement.setString(1, respuestas.get(i));    // Establecer la respuesta nueva
	                statement.setInt(2, idLlamada);                // Establecer el id de llamada
	                statement.setString(3, preguntas.get(i));     // Establecer la pregunta a actualizar
	                
	                statement.addBatch();  // Añadir la operación al batch
	            }
	        }

	        // Ejecutar las operaciones en batch
	        int[] rowsUpdated = statement.executeBatch();
	        return rowsUpdated.length > 0;
	    } catch (SQLException e) {
	        System.out.println("Error con la actualización de preguntas: " + e.getMessage());
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
	        	System.out.println("No se encontró el paciente con DNI: " + dni);
	        	return -1;  
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