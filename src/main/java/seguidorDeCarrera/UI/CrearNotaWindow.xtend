package seguidorDeCarrera.UI


import seguidorDeCarrera.domain.Nota
import org.uqbar.arena.windows.WindowOwner

class CrearNotaWindow extends EditarNotaWindow {
	
	
	new(WindowOwner owner) {
		super(owner, new Nota)
	}
	
	
	override executeTask() {
		homeNota.create(modelObject)
		super.executeTask()
	}
	
	
	
	
	
}