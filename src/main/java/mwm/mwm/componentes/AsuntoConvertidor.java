package mwm.mwm.componentes;

import org.springframework.stereotype.Component;

import mwm.mwm.entidades.Asunto;
import mwm.mwm.modelos.AsuntoModelo;

@Component("asuntoConvertidor")
public class AsuntoConvertidor {
	public Asunto convertidorAsuntoModelo2Asunto(AsuntoModelo asuntoModelo) {
		Asunto asunto=new Asunto();
		asunto.setId_asunto(asuntoModelo.getId_asunto());
		asunto.setIde(asuntoModelo.getIde());
		asunto.setNombre(asuntoModelo.getNombre());
		asunto.setDescripcion(asuntoModelo.getDescripcion());
		return asunto;
	}
	
	public AsuntoModelo convertidorAsunto2ModeloAsunto(Asunto asunto) {
		AsuntoModelo asuntoModelo=new AsuntoModelo();
		asuntoModelo.setId_asunto(asunto.getId_asunto());
		asuntoModelo.setIde(asunto.getIde());
		asuntoModelo.setNombre(asunto.getNombre());
		asuntoModelo.setDescripcion(asunto.getDescripcion());
		return asuntoModelo;
	}
}
