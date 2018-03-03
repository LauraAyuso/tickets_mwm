package mwm.mwm.repositorios;

import java.io.Serializable;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import mwm.mwm.entidades.Asunto;

@Repository("asuntoRepositorio")
public interface AsuntoRepositorio extends JpaRepository<Asunto, Serializable>{
	
}
