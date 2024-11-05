package Clases;
import java.sql.Timestamp;

public class Paciente {
    private int idPaciente;
    private String nombre;
    private String dni;
    private Timestamp fechaHora;

    // Constructor
    public Paciente(String nombre, String dni) {
        this.nombre = nombre;
        this.dni = dni;
        this.fechaHora = new Timestamp(System.currentTimeMillis()); // Asigna la fecha y hora actual
    }

    // Getters y Setters
    public int getIdPaciente() {
        return idPaciente;
    }

    public void setIdPaciente(int idPaciente) {
        this.idPaciente = idPaciente;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getDni() {
        return dni;
    }

    public void setDni(String dni) {
        this.dni = dni;
    }

    public Timestamp getFechaHora() {
        return fechaHora;
    }

    public void setFechaHora(Timestamp fechaHora) {
        this.fechaHora = fechaHora;
    }
}
