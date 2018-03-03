package mwm.mwm.servicios.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import mwm.mwm.componentes.AsuntoConvertidor;
import mwm.mwm.entidades.Asunto;
import mwm.mwm.modelos.AsuntoModelo;
import mwm.mwm.repositorios.AsuntoRepositorio;
import mwm.mwm.servicios.AsuntoServicio;

@Service("asuntoServicioImpl")
public class AsuntoServicioImpl implements AsuntoServicio{

	@Autowired
	@Qualifier("asuntoRepositorio")
	private AsuntoRepositorio asuntoRepositorio;
	
	@Autowired
	@Qualifier("asuntoConvertidor")
	private AsuntoConvertidor asuntoConvertidor;
	
	@Override
	public AsuntoModelo agregarAsunto(AsuntoModelo asuntoModelo) {
		Asunto asunto=asuntoRepositorio.save(asuntoConvertidor.convertidorAsuntoModelo2Asunto(asuntoModelo));
		return asuntoConvertidor.convertidorAsunto2ModeloAsunto(asunto);
	}

	@Override
	public AsuntoModelo obtenerNombreAsunto(AsuntoModelo asuntoModelo) {
		//Asunto asunto=asuntoRepositorio.
		return null;
	}
	
}
