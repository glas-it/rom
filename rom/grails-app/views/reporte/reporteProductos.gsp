
<!DOCTYPE html>
<html>

<head>
    <meta name="layout" content="kickstart" />
    <title>Reporte Productos</title>
    <g:set var="layout_nosecondarymenu" value="false" scope="request"/>
    <script src="${resource(dir:'js',file: 'highcharts.js')}"></script>
    <script src="${resource(dir:'js',file: 'exporting.js')}"></script>
    <script src="${resource(dir:'js',file: 'highcharts-customization.js')}"></script>
    <script src="${resource(dir:'js',file: 'moment-with-langs.min.js')}"></script>
    <script type="text/javascript">
    var chart;

    function requestData() {
        //yyyy/mm/01
        var params = {};
        params.fechaInicio = new Date($("#fechaInicio_year").val(), $("#fechaInicio_month").val() - 1)
        params.fechaFin = new Date($("#fechaFin_year").val(), $("#fechaFin_month").val() - 1)
        params.cant_platos = 20
        /*
        Aca en params falta pasarle un listado de subrubros
        */
        if (validarFechas(params.fechaInicio, params.fechaFin)) {
            $("#pdfButton").removeClass("hide");
            $("#highcharts-report").removeClass("hide");
            $.ajax({
                url: 'getDatosReporteProductos',
                data: params,
                success: function(datos) {
                    chart = buildChart('Ranking de Productos', datos, params);
                },
                cache: false
            });
        }
    }

    function buildChart(titulo, datos, params) {
        var hoy = new Date();
        report_height = 500 + 25 * params.cant_platos;
        Highcharts.tableValuePrefix = '';
        Highcharts.xTitle = "Plato";
        Highcharts.yTitle = "Cantidad";
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

    function validarFechas(fechaIni, fechaFin) {
        if (fechaFin < fechaIni) {
            $('#errorAlert').show();
            $('#errorMessage').text("Fecha inválida: Fecha Fin debe ser posterior a Fecha Inicio");
            return false;
        }

        if (! (fechaFin.getFullYear() - fechaIni.getFullYear() == 0 ||
                (fechaFin.getFullYear() - fechaIni.getFullYear() == 1 &&
                fechaFin.getMonth() - fechaIni.getMonth() <= 2) ) ) {
            $('#errorAlert').show();
            $('#errorMessage').text("Periodo inválido: el periodo comprendido entre Fecha Inicio - Fecha Fin debe ser menor o igual a los 14 meses");
            return false;
        }
        return true;
    }

    function hideError() {
        $('#errorAlert').hide();
    }

    window.onload = function() {
        $("#buscarButton").click( requestData );
        $('#fechaInicio_year').addClass('form-control');
        $('#fechaInicio_month').addClass('form-control');
        $('#fechaFin_year').addClass('form-control');
        $('#fechaFin_month').addClass('form-control');
    }

    </script>

</head>

<body>
    <div id="errorAlert" class="alert alert-danger alert-dismissable" style="display: none;">
        <button type="button" class="close" onclick="javascript:hideError()">&times;</button>
        <strong>Cuidado!</strong>
        <span id="errorMessage"></span>
    </div>
    <div class="">
        <ul id="Menu" class="nav nav-tabs">
            <li class="active">
                <a href="#"></i>Reporte de Productos</a>
            </li>
        </ul>
    </div>
    <br/>
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
                        <input id="buscarButton" type="button" class="btn btn-primary" value="Generar" />
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