package mwm.mwm.controladores;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import mwm.mwm.constantes.VistasConstantes;
import mwm.mwm.modelos.UserCredencial;

@Controller

public class LoginController {
	
	private static final Log LOG = LogFactory.getLog(LoginController.class);
	
	@GetMapping("/")
	public String redirectLogin() {
		LOG.info("Metodo: redirectLogin()");
		LOG.info("Redireccion a la vista del login");
		return "redirect:/login";
	}
	
	@GetMapping("/login")
	public String mostrarLogin(Model model, @RequestParam(name="error", required=false) String error) {
		LOG.info("Metodo: mostrarLogin() -- parametros: error: "+error);
		model.addAttribute("error",error);
		model.addAttribute("userCredencial", new UserCredencial());
		LOG.info("Retornando a la vista del login");
		return VistasConstantes.LOGIN;
	}
	
	@PostMapping("/logincheck")
	public String loginCheck(@ModelAttribute(name="userCredencial") UserCredencial userCredencial) {
		LOG.info("Metodo: loginCheck() -- PARAMETROS: "+userCredencial.toString());
		if(userCredencial.getUsername().equals("user") && userCredencial.getPassword().equals("user")) {
			LOG.info("Retornando a la vista de los ticket");
			return VistasConstantes.TICKETS_ADMIN;
		}
		LOG.info("Redireccion a la vista del login ? error: ");
		return "redirect:/login";
	}
	
}
