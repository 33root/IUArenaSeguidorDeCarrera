package seguidorDeCarrera.domain

import org.uqbar.commons.utils.Observable
import java.util.Date
import org.uqbar.commons.model.Entity

@Observable
class Nota extends Entity implements Cloneable {
	@Property Date fecha
	@Property String descripcion
	@Property Boolean aprobado = false
	
	new(){
		super()
	}
	
	new(String descripcion, Date fecha, Boolean aprobado){
		this.agregarDescripcion(descripcion)
		this.agregarFecha(fecha)
		this.agregarAprobado = aprobado
	}

	def agregarDescripcion(String descripcion) {
		this.descripcion = descripcion
	}

	def nuevaNota(String descripcion, Date fecha, Boolean aprobado) {
		this.agregarDescripcion(descripcion)
		this.agregarFecha(fecha)
		this.agregarAprobado = aprobado

	}

	def agregarFecha(Date fecha) {
		this.fecha = fecha

	}

	def agregarAprobado(Boolean aprob) {
		this.aprobado = aprob
	}

	override clone() {
		super.clone()
	}
	


}
