package seguidorDeCarrera.domain

import java.util.List
import org.uqbar.commons.model.Entity
import org.uqbar.commons.model.UserException
import org.uqbar.commons.utils.Observable

@Observable
class Materia extends Entity implements Cloneable {

	@Property String nombre
	public val static nombre_Property = "nombre"
	@Property List<Nota> notasDeCursada
	@Property Boolean finalAprobado

	new() {
		super()
		this.notasDeCursada = newArrayList

	}

	new(String nombre) {
		this.nombre = nombre
		this.notasDeCursada = newArrayList
	}

	def agregarNota(Nota nota) {
		this.notasDeCursada.add(nota)

	}

	/**
	 * Valida que la materia esté correctamente cargada
	 */
	def validar() {
		if (nombre == null) {
			throw new UserException("Debe ingresar nombre de materia")
		}
	}

}
	
