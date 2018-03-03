package mwm.mwm.modelos;

public class AsuntoModelo {
	private int id_asunto;
	private String ide;
	private String nombre;
	private String descripcion;
	
	public int getId_asunto() {
		return id_asunto;
	}
	public void setId_asunto(int id_asunto) {
		this.id_asunto = id_asunto;
	}
	public String getIde() {
		return ide;
	}
	public void setIde(String ide) {
		this.ide = ide;
	}
	public String getNombre() {
		return nombre;
	}
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	public String getDescripcion() {
		return descripcion;
	}
	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}
	
	public AsuntoModelo(int id_asunto, String ide, String nombre, String descripcion) {
		super();
		this.id_asunto = id_asunto;
		this.ide = ide;
		this.nombre = nombre;
		this.descripcion = descripcion;
	}
	public AsuntoModelo() {
		// TODO Auto-generated constructor stub
	}
	@Override
	public String toString() {
		return "AsuntoModelo [id_asunto=" + id_asunto + ", ide=" + ide + ", nombre=" + nombre + ", descripcion="
				+ descripcion + "]";
	}
	
}
