package seguidorDeCarrera.domain

import org.uqbar.commons.utils.Observable
import java.util.Date
import org.uqbar.commons.model.Entity

@Observable
class Nota extends Entity {
	@Property Date fecha
	@Property String descripcion
	@Property Boolean aprobado
	
	
	def agregarDescripcion(String descripcion){
	this.descripcion = descripcion
}
	
		override clone() {
		super.clone()
	}
	
	
	
}