package mwm.mwm.modelos;

public class TicketModelo {
	private int id_ticket;
	private int asunto_ticket;
	private String descripcion_tikect;
	private String fecha_emsion;
	private String fecha_validez;
	private String estado_ticket;
	private String prioridad_ticket;
	private String atencion_programada;
	public int getId_ticket() {
		return id_ticket;
	}
	public void setId_ticket(int id_ticket) {
		this.id_ticket = id_ticket;
	}
	public int getAsunto_ticket() {
		return asunto_ticket;
	}
	public void setAsunto_ticket(int asunto_ticket) {
		this.asunto_ticket = asunto_ticket;
	}
	public String getDescripcion_tikect() {
		return descripcion_tikect;
	}
	public void setDescripcion_tikect(String descripcion_tikect) {
		this.descripcion_tikect = descripcion_tikect;
	}
	public String getFecha_emsion() {
		return fecha_emsion;
	}
	public void setFecha_emsion(String fecha_emsion) {
		this.fecha_emsion = fecha_emsion;
	}
	public String getFecha_validez() {
		return fecha_validez;
	}
	public void setFecha_validez(String fecha_validez) {
		this.fecha_validez = fecha_validez;
	}
	public String getEstado_ticket() {
		return estado_ticket;
	}
	public void setEstado_ticket(String estado_ticket) {
		this.estado_ticket = estado_ticket;
	}
	public String getPrioridad_ticket() {
		return prioridad_ticket;
	}
	public void setPrioridad_ticket(String prioridad_ticket) {
		this.prioridad_ticket = prioridad_ticket;
	}
	public String getAtencion_programada() {
		return atencion_programada;
	}
	public void setAtencion_programada(String atencion_programada) {
		this.atencion_programada = atencion_programada;
	}
	public TicketModelo(int id_ticket, int asunto_ticket, String descripcion_tikect, String fecha_emsion,
			String fecha_validez, String estado_ticket, String prioridad_ticket, String atencion_programada) {
		super();
		this.id_ticket = id_ticket;
		this.asunto_ticket = asunto_ticket;
		this.descripcion_tikect = descripcion_tikect;
		this.fecha_emsion = fecha_emsion;
		this.fecha_validez = fecha_validez;
		this.estado_ticket = estado_ticket;
		this.prioridad_ticket = prioridad_ticket;
		this.atencion_programada = atencion_programada;
	}
	
	public TicketModelo() {
		// TODO Auto-generated constructor stub
	}
	@Override
	public String toString() {
		return "TicketModelo [id_ticket=" + id_ticket + ", asunto_ticket=" + asunto_ticket + ", descripcion_tikect="
				+ descripcion_tikect + ", fecha_emsion=" + fecha_emsion + ", fecha_validez=" + fecha_validez
				+ ", estado_ticket=" + estado_ticket + ", prioridad_ticket=" + prioridad_ticket
				+ ", atencion_programada=" + atencion_programada + "]";
	}
	
	
}
