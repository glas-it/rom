
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
	<title>Reporte</title>
	<script src="${resource(dir:'js',file: 'highcharts.js')}"></script>
	<script src="${resource(dir:'js',file: 'exporting.js')}"></script>
</head>

<body>
<script type="text/javascript">
var chart;

function requestData() {
    $.ajax({
        url: 'getDatosReporte',
        data: {"saludo":"foo bar"},
        success: function(datos) {
            alert(datos);
            chart.series[0].setData(datos, true);
        },
        cache: false
    });
} 

$(function () {
	chart = new Highcharts.Chart({
    	chart: {
            renderTo: 'container',
            type: 'column'
        },
        title: {
            text: 'Facturación'
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
                text: 'Pesos ($)'
            }
        },
        legend: {
            enabled: false
        },
        tooltip: {
            pointFormat: 'Facturado: <b>$ {point.y:.1f}</b>',
        },
        series: [{
            name: 'Facturacion',
            data: [
                ['Shanghai', 23.7],
                ['Lagos', 16,1],
                ['Instanbul', 14.2],
                ['Karachi', 14.0],
                ['Mumbai', 12.5],
                ['Moscow', 12.1],
                ['São Paulo', 11.8],
                ['Beijing', 11.7],
                ['Guangzhou', 11.1],
                ['Delhi', 11.1],
                ['Shenzhen', 10.5],
                ['Seoul', 10.4],
                ['Jakarta', 10.0],
                ['Kinshasa', 9.3],
                ['Tianjin', 9.3],
                ['Tokyo', 9.0],
                ['Cairo', 8.9],
                ['Dhaka', 8.9],
                ['Mexico City', 8.9],
                ['Lima', 8.9]
            ],
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
		<input id="buscarButton" type="button" value="Buscar" />
		<div id="container" style="min-width: 500px; height: 400px; margin: 0 auto"></div>
	</div>
 	</div>
 </section>



</body>

</html>
