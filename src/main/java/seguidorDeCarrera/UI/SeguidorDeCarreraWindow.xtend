package seguidorDeCarrera.UI

import org.uqbar.arena.windows.WindowOwner
import org.uqbar.arena.windows.SimpleWindow
import seguidorDeCarrera.applicationModel.SeguidorDeCarrera
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.layout.ColumnLayout
import org.uqbar.arena.widgets.tables.Table
import seguidorDeCarrera.domain.Materia
import org.uqbar.arena.widgets.tables.Column
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.TextBox
import java.awt.Color
import org.uqbar.arena.widgets.CheckBox
import org.uqbar.arena.widgets.Selector
import org.uqbar.arena.widgets.Button
import seguidorDeCarrera.domain.Nota
import org.uqbar.arena.windows.Dialog
import org.uqbar.arena.layout.VerticalLayout
import org.uqbar.arena.layout.HorizontalLayout

class SeguidorDeCarreraWindow extends SimpleWindow<SeguidorDeCarrera> {

	new(WindowOwner parent) {
		super(parent, new SeguidorDeCarrera)
		modelObject.actualizar()
	}

	override def createMainTemplate(Panel mainPanel) {
				
		this.setTitle("Seguidor De Carrera")
		this.setTaskDescription("Seguidor de Carrera")
		mainPanel.setLayout(new ColumnLayout(3))
		mainPanel.setWidth(400)
		createFormPanel(mainPanel)

	}

	override protected createFormPanel(Panel mainPanel) {
	
		addPanelMaterias(mainPanel)
		addMateriaSeleccionadaPanel(mainPanel)
		addDatosDeMateriaPanel(mainPanel)		
		addResultadosDeParcialesPanel(mainPanel)

	}

	def addPanelMaterias(Panel mainPanel) {
		var panelDeMaterias = new Panel(mainPanel)
		panelDeMaterias.setLayout(new VerticalLayout)
		this.createGrid(panelDeMaterias)
		addButtons(mainPanel)

	}

	def createGrid(Panel mainPanel) {

		new Table<Materia>(mainPanel, typeof(Materia)) => [
			heigth = 350
			width = 150
			bindItemsToProperty("materias")
			bindValueToProperty("materiaSeleccionada")
			this.describeResultsGrid(it)
		]

	}

	def describeResultsGrid(Table<Materia> table) {
		new Column<Materia>(table).setTitle("Materias").setFixedSize(30).bindContentsToProperty("nombre") //TODO: ver que tiene que ir ahi.
	}

	//**Muestra el nombre de la materia seleccionada**
	def addMateriaSeleccionadaPanel(Panel mainPanel) {
		var panelMateriaSeleccionada = new Panel(mainPanel)
		panelMateriaSeleccionada.setLayout(new HorizontalLayout)
		new Label(mainPanel).bindValueToProperty("materiaSeleccionada.nombre")

	}

	def addDatosDeMateriaPanel(Panel mainPanel) {

		var datosMateriasPanel = new Panel(mainPanel).setWidth(150)
		datosMateriasPanel.setLayout(new ColumnLayout(4))

		var labelAnio = new Label(datosMateriasPanel).setText("Año de Cursada")
		new TextBox(datosMateriasPanel) => [] //TODO: Aca tendria que hacer la busqueda de las materias de ese año
		labelAnio.foreground = Color::RED

		var labelProfesor = new Label(datosMateriasPanel).setText("Profesor")
		new TextBox(datosMateriasPanel) => []
		labelProfesor.foreground = Color::magenta

		var labelFinalAprobado = new Label(datosMateriasPanel).setText("Final Aprobado")
		labelAnio.foreground = Color::BLUE
		var checkFinalAprobado = new CheckBox(datosMateriasPanel)

//		checkFinalAprobado.bindEnabledToProperty("materiaSeleccionada.finalAprobado")
		checkFinalAprobado.bindValueToProperty("materiaSeleccionada.finalAprobado")
		new Label(datosMateriasPanel).setText("Ubicación materia").foreground = Color::ORANGE

		new Selector(datosMateriasPanel).allowNull(false) => [
			width = 150
			bindItemsToProperty("ubicaciones")
		]
	}

	def addButtons(Panel mainPanel) {
		var buttonsPanel = new Panel(mainPanel)
		buttonsPanel.setLayout(new ColumnLayout(3))
		this.addActions(buttonsPanel)
	}

	override protected addActions(Panel actionsPanel) {
		new Button(actionsPanel).setCaption("Nueva Materia").onClick [ |
			this.nuevaMateria
		].setAsDefault

	}

	def addResultadosDeParcialesPanel(Panel mainPanel) {
		var resultadosDeParcialesPanel = new Panel(mainPanel)
		resultadosDeParcialesPanel.setLayout(new ColumnLayout(1))
		this.createGridResultadosParcial(resultadosDeParcialesPanel)

		addButtonsPrueba(resultadosDeParcialesPanel)

	}

	def createGridResultadosParcial(Panel mainPanel) {
		var notasDeParcialLabel = new Label(mainPanel).setText("Notas de Parcial")

		new Table<Nota>(mainPanel, typeof(Nota)) => [
			heigth = 50
			width = 300
			//			bindItemsToProperty("nombre")
			this.describeGridResultadosParcial(it)
		]
	}

	def describeGridResultadosParcial(Table<Nota> table) { //TODO: hacer un builder para cada columna
		new Column<Nota>(table).setTitle("Fecha").setFixedSize(60).bindContentsToProperty("fecha")

		new Column<Nota>(table).setTitle("Descripcion").setFixedSize(60).bindContentsToProperty("descripcion")

		new Column<Nota>(table).setTitle("Aprobado").setFixedSize(60).bindContentsToProperty("aprobado").
			bindContentsToTransformer([nota|if(nota.aprobado) "SI" else "NO"])

	}

	def addButtonsPrueba(Panel resultadosDeParcialesPanel) {

		var buttonsPanel = new Panel(resultadosDeParcialesPanel)
		buttonsPanel.setLayout(new ColumnLayout(7))
		this.addActions2(buttonsPanel)

	}

	//TODO: Hacer un builder para los botones
	def addActions2(Panel buttonsPanel) {
		new Button(buttonsPanel)//TODO: Falta que verifique que alguna nota este seleccionada
		.setCaption("Editar")
		.onClick[|this.editarNota].setAsDefault

		new Button(buttonsPanel)
		.setCaption("+")
		.onClick[
			|this.crearNota
		]

		new Button(buttonsPanel) //TODO: preguntar si esta seguro de querer borrar
		.setCaption("-")
		.onClick[
			|modelObject.borrarMateria
		]

	}

	//****Acciones de los botones**//
	def void nuevaMateria() {
		this.openDialog(new NuevaMateriaWindow(this))
	}

	def void editarNota() {
		this.openDialog(new EditarNotaWindow(this, modelObject.notaSeleccionada))
	}

	def openDialog(Dialog<?> dialog) {
		dialog.onAccept[|modelObject.actualizar]
		dialog.open
	}

	def void crearNota() {
		this.openDialog(new CrearNotaWindow(this))
	}

	def void borrarNota() { //TODO: Que borre el que esté seleccionado
	}

}
