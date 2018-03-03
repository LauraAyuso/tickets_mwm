package mwm.mwm.controladores;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import mwm.mwm.constantes.VistasConstantes;

@Controller
@RequestMapping("/ticket")
public class TicketControlador {
	private static final Log LOG = LogFactory.getLog(AsuntoControlador.class);
	
	@GetMapping("/cancel")
	public String cancel() {
		LOG.info("Se cancelo el registro del nuevo ticket");
		return VistasConstantes.TICKETS_ADMIN;
	}
	
	@GetMapping("/ticketformulario")
	public String ticketFormulario() {	
		return VistasConstantes.TICKET_FORMULARIO;
	}
}
