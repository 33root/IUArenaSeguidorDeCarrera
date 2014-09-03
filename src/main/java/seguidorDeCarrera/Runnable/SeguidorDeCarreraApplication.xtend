package seguidorDeCarrera.Runnable

import org.uqbar.arena.Application
import org.uqbar.arena.windows.Window
import org.uqbar.commons.utils.ApplicationContext
import seguidorDeCarrera.UI.SeguidorDeCarreraWindow
import seguidorDeCarrera.home.HomeMaterias
import seguidorDeCarrera.home.HomeNotas
import seguidorDeCarrera.domain.Nota
import seguidorDeCarrera.domain.Materia

class SeguidorDeCarreraApplication extends Application{
	
	


static def void main(String[] args) { 
		new SeguidorDeCarreraApplication().start()
	}
	
override protected Window<?> createMainWindow() {
		ApplicationContext.instance.configureSingleton(typeof(Nota), new HomeNotas)
		ApplicationContext.instance.configureSingleton(typeof(Materia), new HomeMaterias)
		return new SeguidorDeCarreraWindow(this)
	}
		
	
	
}
	
