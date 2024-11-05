package Clases;

public class Llamada {
	private int id_llamada;
	private Paciente paciente;
	private Trabajador trabajador;
	private String consejo;
	private String estado;
	public Llamada(int id_llamada, Paciente paciente, Trabajador trabajador, String consejo, String estado) {
		super();
		this.id_llamada = id_llamada;
		this.paciente = paciente;
		this.trabajador = trabajador;
		this.consejo = consejo;
		this.estado = estado;
	}
	public int getId_llamada() {
		return id_llamada;
	}
	public void setId_llamada(int id_llamada) {
		this.id_llamada = id_llamada;
	}
	public Paciente getPaciente() {
		return paciente;
	}
	public void setPaciente(Paciente paciente) {
		this.paciente = paciente;
	}
	public Trabajador getTrabajador() {
		return trabajador;
	}
	public void setTrabajador(Trabajador trabajador) {
		this.trabajador = trabajador;
	}
	public String getConsejo() {
		return consejo;
	}
	public void setConsejo(String consejo) {
		this.consejo = consejo;
	}
	public String getEstado() {
		return estado;
	}
	public void setEstado(String estado) {
		this.estado = estado;
	}
	
	
	
	
	
}
