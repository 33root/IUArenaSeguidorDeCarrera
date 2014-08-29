package seguidorDeCarrera.domain

import java.util.List
import org.uqbar.commons.model.Entity

class Materia extends Entity {

	@Property String nombre
	public val static nombre_Property = "nombre"
	@Property List<Nota> notasDeCursada

	new() {
		super()
		this.notasDeCursada = newArrayList

	}

	new(String nombre) {
		this.nombre = nombre
		this.notasDeCursada = newArrayList
	}
	
	def agregarNota(Nota nota){
		this.notasDeCursada.add(nota)
		
	}
}
