package seguidorDeCarrera.home

import org.uqbar.commons.model.CollectionBasedHome
import seguidorDeCarrera.domain.Nota
import org.uqbar.commons.utils.Observable
import org.apache.commons.collections15.Predicate
import java.util.Date

@Observable
class HomeNotas extends CollectionBasedHome<Nota>  {
	
	def create(String descripcion, Date fecha, boolean aprobado) {
		var nota = new Nota(descripcion, fecha, aprobado)
		this.create(nota)
		return nota
	}
	
	def createNota(String descripcion, Date fecha, Boolean aprobado){
		
		new Nota(descripcion, fecha, aprobado)
		
		
	}
	
	override void validateCreate(Nota nota) {
		nota.validar()
		
	}
	
	override def getEntityType() {
		typeof(Nota)
	}

	override def createExample() {
		new Nota
	}

	override def Predicate<Nota> getCriterio(Nota example) {
		null
	}
	
}