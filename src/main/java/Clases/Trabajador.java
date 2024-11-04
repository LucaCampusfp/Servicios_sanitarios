package Clases;

public class Trabajador {
	private int id;
	private String nombre;
	private int pass;
	private String rol;
	private String turno;
	private int llamadas_atendidas;
	private int llamadas_derivadas;
	public Trabajador(int id, String nombre, int pass, String rol, String turno, int llamadas_atendidas,
			int llamadas_derivadas) {
		this.id = id;
		this.nombre = nombre;
		this.pass = pass;
		this.rol = rol;
		this.turno = turno;
		this.llamadas_atendidas = llamadas_atendidas;
		this.llamadas_derivadas = llamadas_derivadas;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getNombre() {
		return nombre;
	}
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	public int getPass() {
		return pass;
	}
	public void setPass(int pass) {
		this.pass = pass;
	}
	public String getRol() {
		return rol;
	}
	public void setRol(String rol) {
		this.rol = rol;
	}
	public String getTurno() {
		return turno;
	}
	public void setTurno(String turno) {
		this.turno = turno;
	}
	public int getLlamadas_atendidas() {
		return llamadas_atendidas;
	}
	public void setLlamadas_atendidas(int llamadas_atendidas) {
		this.llamadas_atendidas = llamadas_atendidas;
	}
	public int getLlamadas_derivadas() {
		return llamadas_derivadas;
	}
	public void setLlamadas_derivadas(int llamadas_derivadas) {
		this.llamadas_derivadas = llamadas_derivadas;
	}
	
	
	
	
	
}