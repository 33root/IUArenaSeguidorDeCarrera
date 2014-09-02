package seguidorDeCarrera.home

import org.uqbar.commons.model.CollectionBasedHome
import seguidorDeCarrera.domain.Nota
import org.uqbar.commons.utils.Observable
import org.apache.commons.collections15.Predicate

@Observable
class HomeNotas extends CollectionBasedHome<Nota>  {
	
	def create(String nombre) {
		var nota = new Nota
		this.create(nota)
		return nota
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