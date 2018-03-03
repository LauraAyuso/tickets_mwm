package mwm.mwm.entidades;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="t_tickets")
public class Ticket {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="id_ticket")
	private int id;
	
	@ManyToOne
	@JoinColumn(name="asunto_ticket")
	private Asunto asunto;
	
	@Column(name="descripcion_ticket")
	private String descripcion_ticket;
	
	@Column(name="fecha_emision")
	private String fe;
	
	@Column(name="fecha_validez")
	private String fv;
	
	@Column(name="estado_ticket")
	private String estado;
	
	@Column(name="prioridad_ticket")
	private String prioridad;
	
	@Column(name="atencion_programada")
	private String at;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Asunto getAsunto() {
		return asunto;
	}

	public void setAsunto(Asunto asunto) {
		this.asunto = asunto;
	}

	public String getDescripcion_ticket() {
		return descripcion_ticket;
	}

	public void setDescripcion_ticket(String descripcion_ticket) {
		this.descripcion_ticket = descripcion_ticket;
	}

	public String getFe() {
		return fe;
	}

	public void setFe(String fe) {
		this.fe = fe;
	}

	public String getFv() {
		return fv;
	}

	public void setFv(String fv) {
		this.fv = fv;
	}

	public String getEstado() {
		return estado;
	}

	public void setEstado(String estado) {
		this.estado = estado;
	}

	public String getPrioridad() {
		return prioridad;
	}

	public void setPrioridad(String prioridad) {
		this.prioridad = prioridad;
	}

	public String getAt() {
		return at;
	}

	public void setAt(String at) {
		this.at = at;
	}

	public Ticket(int id, Asunto asunto, String descripcion_ticket, String fe, String fv, String estado,
			String prioridad, String at) {
		super();
		this.id = id;
		this.asunto = asunto;
		this.descripcion_ticket = descripcion_ticket;
		this.fe = fe;
		this.fv = fv;
		this.estado = estado;
		this.prioridad = prioridad;
		this.at = at;
	}
	
	public Ticket() {
		// TODO Auto-generated constructor stub
	}

	@Override
	public String toString() {
		return "Ticket [id=" + id + ", asunto=" + asunto + ", descripcion_ticket=" + descripcion_ticket + ", fe=" + fe
				+ ", fv=" + fv + ", estado=" + estado + ", prioridad=" + prioridad + ", at=" + at + "]";
	}
	
	
}
