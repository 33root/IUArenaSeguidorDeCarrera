package seguidorDeCarrera.UI

import org.uqbar.arena.windows.Dialog
import seguidorDeCarrera.domain.Nota
import org.uqbar.arena.windows.WindowOwner
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.TextBox
import org.uqbar.arena.layout.ColumnLayout
import org.uqbar.arena.widgets.CheckBox
import seguidorDeCarrera.home.HomeNotas
import org.uqbar.commons.utils.ApplicationContext
import org.uqbar.arena.widgets.Button

class EditarNotaWindow extends Dialog<Nota> {
	
	Nota original

	new(WindowOwner owner, Nota nota) {

		super(owner, nota)
		original = nota.clone() as Nota
	}
	override protected createFormPanel(Panel mainPanel) {

		this.setTitle("Editar Nota")
		
		
		new Label(mainPanel).text = "Fecha:"
		new TextBox(mainPanel).bindValueToProperty("fecha")
		
		
		new Label(mainPanel).text = "Descripcion"

		 new TextBox(mainPanel).bindValueToProperty("descripcion")
		
		
		val form = new Panel(mainPanel)
		form.layout = new ColumnLayout(2)
		new Label(form).text = "Aprobado"
		var checkResumen = new CheckBox(form)
		checkResumen.bindValueToProperty("aprobado")
	}
	
	def getHomeNota() {
		//ApplicationContext.instance.getSingleton(typeof(Nota)) as HomeNotas //creo que aca esta el problema del "+" nota no funcione esta acá
	}
	
	override protected void addActions(Panel actions) {
		new Button(actions)
		.setCaption("Aceptar")
		.onClick[|this.accept]
		.setAsDefault

	}
}