
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
	<title>Reporte Productos</title>
	<script src="${resource(dir:'js',file: 'highcharts.js')}"></script>
	<script src="${resource(dir:'js',file: 'exporting.js')}"></script>
</head>

<body>
<script type="text/javascript">
var chart;

function requestData() {
	//yyyy/mm/01
	var params = {};
	params.fechaInicio = new Date($("#fechaInicio_year").val(), $("#fechaInicio_month").val() - 1, $("#fechaInicio_day").val());
	params.fechaFin = new Date($("#fechaFin_year").val(), $("#fechaFin_month").val() - 1, $("#fechaFin_day").val());

	/*
	Aca en params falta pasarle un listado de subrubros
	*/
	
	if (validarFechas(params.fechaInicio, params.fechaFin)) {
	    $.ajax({
	        url: 'getDatosReporteProductos',
	        data: params,
	        success: function(datos) {
	            chart.series[0].setData(datos, true);
	        },
	        cache: false
	    });
	}
} 


function validarFechas(fechaIni, fechaFin) {
	if (fechaFin < fechaIni) {
		alert("Fecha inválida: la fecha 'desde' es posterior a la fecha 'hasta'");
		return false;
	}

	if (! (fechaFin.getFullYear() - fechaIni.getFullYear() == 0 ||
			(fechaFin.getFullYear() - fechaIni.getFullYear() == 1 && 
			fechaFin.getMonth() - fechaIni.getMonth() <= 2) ) ) {
		alert("Periodo inválido: el periodo comprendido entre el desde/hasta debe ser menor o igual a los 14 meses");
		return false;
	}
	return true;
}

$(function () {
	chart = new Highcharts.Chart({
    	chart: {
            renderTo: 'container',
            type: 'column'
        },
        title: {
            text: 'Ventas'
        },
        xAxis: {
            type: 'category',
            labels: {
                rotation: -45,
                style: {
                    fontSize: '13px',
                    fontFamily: 'Verdana, sans-serif'
                }
            }
        },
        yAxis: {
            min: 0,
            title: {
                text: 'Cantidad vendido'
            }
        },
        legend: {
            enabled: false
        },
        tooltip: {
            pointFormat: 'Cantidad: <b> {point.y}</b>',
        },
        series: [{
            name: 'Ventas',
            data: [],
            dataLabels: {
                enabled: true,
                rotation: -90,
                color: '#FFFFFF',
                align: 'right',
                x: 4,
                y: 10,
                style: {
                    fontSize: '13px',
                    fontFamily: 'Verdana, sans-serif',
                    textShadow: '0 0 3px black'
                }
            }
        }]
    });

	$("#buscarButton").click( requestData );

});

</script>

 <section id="list-orden" class="first">
	<div class="panel panel-default tab-content">
	<div class="panel-body">
		
		<div class="row">
			<div class="col-md-2">
				<label for="fechaInicio" class="control-label">Fecha Inicio</label>
			</div>
			<div class="col-md-4">
				<g:datePicker class="form-control" name="fechaInicio" precision="day"   />
			</div>
			<div class="col-md-2">
				<label for="fechaFin" class="control-label">Fecha Fin</label>
			</div>
			<div class="col-md-4">
				<g:datePicker class="form-control" name="fechaFin" precision="day"  />
			</div>
		</div>
		<br/>
				
		<div class="row">
			<div class="col-md-4 text-center">
				<input id="pdfButton" type="button" class="btn btn-primary" value="PDF" />
			</div>
			
			<div class="col-md-4 text-center pull-right">
				<input id="buscarButton" type="button" class="btn btn-primary" value="Buscar" />
			</div>
		</div>		
				
		<div id="container" style="min-width: 500px; height: 400px; margin: 0 auto"></div>
		
	</div>
 	</div>
 </section>



</body>

</html>