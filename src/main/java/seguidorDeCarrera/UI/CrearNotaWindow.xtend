package seguidorDeCarrera.UI


import seguidorDeCarrera.domain.Nota
import org.uqbar.arena.windows.WindowOwner

class CrearNotaWindow extends EditarNotaWindow {
	
	
	new(WindowOwner owner) {//intente poner aca la materia seleccionada para poder mandarle una nueva nota y que la agregue pero no pude...
		super(owner, new Nota)
	}
	
	
	override executeTask() {
		homeNota.create(modelObject)
		
		super.executeTask()
	}
	
	
	
	
	
}