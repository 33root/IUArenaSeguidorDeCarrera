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
		var nota1 = this.createNota("Primer Parcial", new Date(13/13/13), true)
		var nota2 = this.createNota("Segundo Parcial", new Date(10/10/10), false)
		var nota3 = this.createNota("Primer Parcial", new Date(10/07/10), true)
		var nota4 = this.createNota("TP", new Date (10/10/11), false)
		var materia1 = this.create("Lengua")
		var materia2 = this.create("Matematica")
		materia1.agregarNota(nota1)
		materia1.agregarNota(nota2)
		materia2.agregarNota(nota3)
		materia2.agregarNota(nota4)
		
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

	def create(String pNombre) {
		var materia = new Materia(pNombre)
		this.create(materia)
		return materia
	}
	
	def createNota(String descripcion, Date fecha, Boolean aprobado){
		
		new Nota(descripcion, fecha, aprobado)
		
		
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