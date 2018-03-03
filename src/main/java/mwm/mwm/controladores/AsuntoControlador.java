package mwm.mwm.controladores;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import mwm.mwm.constantes.VistasConstantes;
import mwm.mwm.modelos.AsuntoModelo;
import mwm.mwm.servicios.AsuntoServicio;

@Controller
@RequestMapping("/asuntos")
public class AsuntoControlador {
	private static final Log LOG = LogFactory.getLog(AsuntoControlador.class);
	
	@Autowired
	@Qualifier("asuntoServicioImpl")
	private AsuntoServicio asuntoServicio;
	
	@GetMapping("/cancel")
	public String cancel() {
		LOG.info("Se cancelo el modal formulario");
		return VistasConstantes.TICKETS_ADMIN;
	}
	
	@GetMapping("/asuntoformulario")
	public String redireccionarAsuntoContacto(Model model) {
		model.addAttribute("asuntoModelo", new AsuntoModelo());
		LOG.info("Se abrira el formulario");
		return VistasConstantes.ASUNTO_FORMULARIO;
	}
	
	@PostMapping("/agregarasunto")
	public String agregarAsunto(@ModelAttribute(name="asuntoModelo") AsuntoModelo asuntoModelo, Model model) {
		LOG.info("Datos del formulario: "+asuntoModelo.toString());
		
		if(asuntoServicio.agregarAsunto(asuntoModelo)!=null) {
			model.addAttribute("resultadoAsunto" , 1);
		} else {
			model.addAttribute("resultadoAsunto" , 0);
		}
		return VistasConstantes.TICKETS_ADMIN;		
	}
}
