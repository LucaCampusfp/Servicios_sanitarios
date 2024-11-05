package Clases;

public class Pregunta {
	private int id_pregunta;
	private String pregunta1;
	private String pregunta2;
	private String pregunta3;
	
	private String respuesta1;
	private String respuesta2;
	private String respuesta3;
	public Pregunta(int id_pregunta, String pregunta1, String pregunta2, String pregunta3, String respuesta1,
			String respuesta2, String respuesta3) {
		super();
		this.id_pregunta = id_pregunta;
		this.pregunta1 = pregunta1;
		this.pregunta2 = pregunta2;
		this.pregunta3 = pregunta3;
		this.respuesta1 = respuesta1;
		this.respuesta2 = respuesta2;
		this.respuesta3 = respuesta3;
	}
	public int getId_pregunta() {
		return id_pregunta;
	}
	public void setId_pregunta(int id_pregunta) {
		this.id_pregunta = id_pregunta;
	}
	public String getPregunta1() {
		return pregunta1;
	}
	public void setPregunta1(String pregunta1) {
		this.pregunta1 = pregunta1;
	}
	public String getPregunta2() {
		return pregunta2;
	}
	public void setPregunta2(String pregunta2) {
		this.pregunta2 = pregunta2;
	}
	public String getPregunta3() {
		return pregunta3;
	}
	public void setPregunta3(String pregunta3) {
		this.pregunta3 = pregunta3;
	}
	public String getRespuesta1() {
		return respuesta1;
	}
	public void setRespuesta1(String respuesta1) {
		this.respuesta1 = respuesta1;
	}
	public String getRespuesta2() {
		return respuesta2;
	}
	public void setRespuesta2(String respuesta2) {
		this.respuesta2 = respuesta2;
	}
	public String getRespuesta3() {
		return respuesta3;
	}
	public void setRespuesta3(String respuesta3) {
		this.respuesta3 = respuesta3;
	}
	
	
	
	
	
}
