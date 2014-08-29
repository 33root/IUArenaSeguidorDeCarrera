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
import org.uqbar.arena.layout.ColumnLayout

class NuevaMateriaWindow extends Dialog<Materia> {

	new(WindowOwner parent) {
		super(parent, new Materia)
	}


	override createFormPanel(Panel mainPanel) {
		this.setTitle("Nueva Materia")

		val form = new Panel(mainPanel)
		form.layout = new ColumnLayout(2)

		new Label(mainPanel).text = "Nombre:"
		val textoNombre = new TextBox(mainPanel)
		textoNombre.bindValueToProperty("nombre")
		textoNombre.width = 200

	}

	override protected void addActions(Panel actions) {
		new Button(actions)
		.setCaption("Aceptar")
		.onClick[|this.accept]
		.setAsDefault

	}

	override executeTask() {
		homeMaterias.create(modelObject)
		super.executeTask()
	}

	def getHomeMaterias() {
		ApplicationContext.instance.getSingleton(typeof(Materia)) as HomeMaterias
	}
}
