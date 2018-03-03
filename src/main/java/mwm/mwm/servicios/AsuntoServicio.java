package mwm.mwm.servicios;

import mwm.mwm.modelos.AsuntoModelo;

public interface AsuntoServicio {
	public abstract AsuntoModelo agregarAsunto(AsuntoModelo asuntoModelo);
	public abstract AsuntoModelo obtenerNombreAsunto(AsuntoModelo asuntoModelo);
}
