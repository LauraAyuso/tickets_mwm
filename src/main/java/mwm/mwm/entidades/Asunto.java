package mwm.mwm.entidades;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="t_asuntos")
public class Asunto {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="id_asunto")
	private int id_asunto;
	@Column(name="ide")
	private String ide;
	@Column(name="nombre")
	private String nombre;
	@Column(name="descripcion")
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
	public Asunto(int id_asunto, String ide, String nombre, String descripcion) {
		super();
		this.id_asunto = id_asunto;
		this.ide = ide;
		this.nombre = nombre;
		this.descripcion = descripcion;
	}
	
	public Asunto() {
		// TODO Auto-generated constructor stub
	}
	@Override
	public String toString() {
		return "Asunto [id_asunto=" + id_asunto + ", ide=" + ide + ", nombre=" + nombre + ", descripcion=" + descripcion
				+ "]";
	}
	
}
