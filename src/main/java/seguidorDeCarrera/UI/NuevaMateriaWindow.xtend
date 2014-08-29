package seguidorDeCarrera.UI

import seguidorDeCarrera.domain.Materia
import org.uqbar.arena.windows.WindowOwner
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.windows.Dialog
import org.uqbar.arena.widgets.TextBox
import org.uqbar.arena.widgets.Button
import seguidorDeCarrera.home.HomeMaterias
import org.uqbar.commons.utils.ApplicationContext

class NuevaMateriaWindow extends Dialog<Materia> {

	new(WindowOwner parent) {
		super(parent, new Materia)
	}

	override createContents(Panel mainPanel) {

		this.setTitle("Nueva Materia")

		new Label(mainPanel).text = "Nombre:"
		val textoNombre = new TextBox(mainPanel)
		textoNombre.bindValueToProperty("nombre")
		textoNombre.width = 200
	}

	override createFormPanel(Panel mainPanel) {
		this.setTitle("Nueva Materia")

		new Label(mainPanel).text = "Nombre:"
		val textoNombre = new TextBox(mainPanel)
		textoNombre.bindValueToProperty("nombre")
		textoNombre.width = 200

		new Button(mainPanel) => [
			caption = "Aceptar"
			onClick [ |
				this.accept
			]
		]

	}

	override executeTask() {
		homeMaterias.create(modelObject)
		super.executeTask()
	}
	
	def getHomeMaterias() {
		ApplicationContext.instance.getSingleton(typeof(Materia)) as HomeMaterias
	}
}
