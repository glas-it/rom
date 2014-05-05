/**
 * Devuelve la ubicacion raiz del sitio
 * Para ello debe existir el elemento que la contenga con id=baseURL
 * o hardcodearlo aca
 */
function cymait_baseURL(){
	return $("#baseURL").text().trim()
}

/**
 * Elimina una columna dinamicamente
 * No envia peticion al servidor
 * Busca la columna con id="rowDinamicTable_[number]"
 * @param number
 */
function cymait_dinamicTable_removeRow(number,contenedor){
	$(contenedor+" #rowDinamicTable_"+number).remove()
	$(".tableRow").each(function(i, val) {
		$(val).removeClass('even')
		$(val).removeClass('odd')
		$(val).addClass((i % 2 == 0)? 'even' : 'odd')
	});
}

/**
 * Agrega una fila a container con el contenido obtenido de controller
 * @param controller
 * @param container
 */
function cymait_dinamicTable_addRow(controller,container){
	var baseURL = cymait_baseURL()
	$.ajax({
			url: baseURL + controller,
			data: {
				'cantFilas': (cymait_dinamicTable_qRows(container)+1),
			},
			success: function(data) {
				$(container).append(data);
			},
			error: function() {
				alert("Error");
			}
		});
}

/**
 * Calcula la cantidad de filas que tiene un container
 * Las filas deben pertenecer a la clase rowDinamicTable
 * @param container
 */
function cymait_dinamicTable_qRows(container){
	qRows = 0;
	//Obtengo el id de la ultima agregada pero sin cargar
	lastNewRow = $(container+" [id^=rowDinamicTable_]:last").attr('id');
	if(lastNewRow != null){
		qRows = lastNewRow.split('_')[1];
	}else{
		//Si es null cuento cuantas hay cargadas
		qRows = $(container+" .rowDinamicTable").length;
	}
	return parseInt(qRows);
	
	
}