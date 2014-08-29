package seguidorDeCarrera.applicationModel

import org.uqbar.commons.utils.Observable
import java.util.List
import seguidorDeCarrera.domain.Materia
import java.util.ArrayList
import java.util.Observer
import seguidorDeCarrera.domain.Nota
import org.uqbar.commons.utils.ApplicationContext
import seguidorDeCarrera.home.HomeMaterias

@Observable
class SeguidorDeCarrera {
	
	@Property List<Materia> materias = new ArrayList
	@Property List<String> ubicaciones
	@Property int anioDeCursada
	val static aniodeCursada_Property = "anioDeCursada"
	@Property Boolean finalAprobado
	@Property String nombre
	public val static nombre_Property = "nombre"
	

	@Property Observer observerDelCheckBoxAprobado
	@Property Observer observerDelAnioDeCursada

	//Selecciones
	@Property Materia materiaSeleccionada
	@Property Nota notaSeleccionada
	
	
	new() {
		this.inicializarColeccionDeMaterias
		this.inicializarUbicaciones

	}
	
	def inicializarUbicaciones() {
		ubicaciones = newArrayList
	}

	def void inicializarColeccionDeMaterias() {
		materias = newArrayList
		
		}
	def actualizar() {
		materias = newArrayList

		this.materias = homeMaterias.allInstances.toList
		this.seleccionarMateriaNumeroUno

	}
	
	def HomeMaterias getHomeMaterias() {
		ApplicationContext.instance.getSingleton(typeof(Materia))

	}
	
	def seleccionarMateriaNumeroUno() {
		if (materias.size > 0)
			materiaSeleccionada = materias.get(0)
	}
	
	def borrarMateria() {
		getHomeMaterias().delete(materiaSeleccionada)
		this.actualizar
		materiaSeleccionada = null
	}
}