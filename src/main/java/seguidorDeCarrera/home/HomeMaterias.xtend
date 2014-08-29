package seguidorDeCarrera.home

import org.uqbar.commons.utils.Observable
import org.uqbar.commons.model.CollectionBasedHome
import seguidorDeCarrera.domain.Materia
import org.apache.commons.collections15.Predicate
import seguidorDeCarrera.domain.Nota
import java.util.Date

@Observable
class HomeMaterias extends CollectionBasedHome<Materia> {

	new() {
		this.init
	}

	def void init() {
		this.create("Matematica")
		this.create("Lengua")
		this.inicializarUbicaciones()
		

	}

def inicializarUbicaciones() {
		var ubicaciones = newArrayList
		ubicaciones.add("2014 - 1°Cuatrimestre")
		ubicaciones.add("2014 - 2°Cuatrimestre")
		ubicaciones.add("2014 - Anual")
		ubicaciones.add("2013 - 1°Cuatrimestre")
		ubicaciones.add("2013 - 2°Cuatrimestre")
		ubicaciones.add("2013 - Anual")
		ubicaciones.add("2012 - 1°Cuatrimestre")
		ubicaciones.add("2012 - 2°Cuatrimestre")
		ubicaciones.add("2012 - Anual")
		
		return ubicaciones
	}

	def void create(String pNombre) {
		var materia = new Materia(pNombre)
		var nota = new Nota("Parcial", new Date(02/20/10), true)
		var nota2 = new Nota("Parcial", new Date(13/13/13), false)
		materia.notasDeCursada.add(nota)
		materia.notasDeCursada.add(nota2)
		this.create(materia)
	}
	
	
	override def Predicate<Materia> getCriterio(Materia example) {
		null
	}
	
	override void validateCreate(Materia materia) {
		materia.validar()
		
	}

	override createExample() {
		new Materia()
	}

	override def getEntityType() {
		typeof(Materia)
	}
}