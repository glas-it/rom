
<!DOCTYPE html>
<html>

<head>
    <meta name="layout" content="kickstart" />
    <title>Reporte</title>
    <script src="${resource(dir:'js',file: 'highcharts.js')}"></script>
    <script src="${resource(dir:'js',file: 'exporting.js')}"></script>
    <script src="${resource(dir:'js',file: 'highcharts-customization.js')}"></script>
    <script src="${resource(dir:'js',file: 'moment-with-langs.min.js')}"></script>
</head>

<body>
<script type="text/javascript">
var chart;

function monthDiff(d1, d2) {
    var months;
    months = (d2.getFullYear() - d1.getFullYear()) * 12;
    months -= d1.getMonth() + 1;
    months += d2.getMonth();
    return months <= 0 ? 0 : months;
}

function requestData() {
    //yyyy/mm/01
    var params = {};
    $("#pdfButton").removeClass("hide");
    $("#highcharts-report").removeClass("hide");
    params.fechaInicio = new Date($("#fechaInicio_year").val(), $("#fechaInicio_month").val() - 1)
    params.fechaFin = new Date($("#fechaFin_year").val(), $("#fechaFin_month").val() - 1)

    $.ajax({
        url: 'getDatosReporte',
        data: params,
        success: function(datos) {
            chart = buildChart('Reporte de Facturación', datos, params);
        },
        cache: false
    });
}

function buildChart(titulo, datos, params) {
    var hoy = new Date();
    report_height = 500 + 25 * monthDiff(params.fechaInicio, params.fechaFin);
    return new Highcharts.Chart({
        chart: {
            renderTo: 'highcharts-report',
            type: 'column',
            events: {
                load: Highcharts.drawTable
            },
            height: report_height,
            spacingBottom: report_height - 400,
            marginTop: 100
        },
        exporting: {
            enabled: true,
            filename: titulo + "-" + hoy.getDate() + "-" + hoy.getMonth() + "-" + hoy.getFullYear() + "-" + hoy.getHours() + "-" + hoy.getMinutes() + "-" + hoy.getSeconds()
        },
        title: {
            text: titulo
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
            data: datos,
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
};

window.onload = function() {
    $("#buscarButton").click( requestData );
    $('#fechaInicio_year').addClass('form-control');
    $('#fechaInicio_month').addClass('form-control');
    $('#fechaFin_year').addClass('form-control');
    $('#fechaFin_month').addClass('form-control');
}

</script>

 <section id="list-orden" class="first">
    <div class="panel panel-default tab-content">
        <div class="panel-body">
            <div class="row form-inline">
                <div class="form-group col-md-4 form-horizontal col-md-offset-2">
                    <label for="fechaInicio" class="col-md-4 control-label" style="padding-left:0px; text-align: left;">Fecha Inicio</label>
                    <div>
                        <g:datePicker id="fechaInicio" name="fechaInicio" precision="month" class="form-control"/>
                    </div>
                </div>
                <div class="form-group col-md-4 form-horizontal">
                    <label for="fechaInicio" class="col-md-4 control-label" style="padding-left:0px; text-align: left;">Fecha Fin</label>
                    <div>
                        <g:datePicker class="form-control" name="fechaFin" precision="month"  />
                    </div>
                </div>
            </div>
            <br/>
            <div class="row" style="padding-bottom:10px">
                <div class="col-md-2 text-center col-md-offset-2">
                    <input id="buscarButton" type="button" class="btn btn-primary" value="Buscar" />
                </div>

                <div class="col-md-2 text-center col-md-offset-4">
                    <input id="pdfButton" type="button" class="btn btn-primary hide" value="PDF" />
                </div>
            </div>
            <div class="row">
                <div id="highcharts-report" class="thumbnail col-md-7 center-block hide" style="float: none;"></div>
            </div>
        </div>
    </div>
 </section>
</body>
</html>
