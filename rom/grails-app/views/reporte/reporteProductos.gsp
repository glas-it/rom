
<!DOCTYPE html>
<html>

<head>
    <meta name="layout" content="kickstart" />
    <title>Reporte Productos</title>
    <g:set var="layout_nosecondarymenu" value="false" scope="request"/>
    <link rel="stylesheet" media="screen" type="text/css" href="${resource(dir: 'css', file: 'jquery.multiselect2side.css')}" />
    <script src="${resource(dir:'js',file: 'highcharts.js')}"></script>
    <script src="${resource(dir:'js',file: 'highcharts-customization.js')}"></script>
    <script src="${resource(dir:'js',file: 'moment-with-langs.min.js')}"></script>
    <script src="${resource(dir:'js',file: 'jquery.browser.min.js')}"></script>
    <script src="${resource(dir:'js',file: 'jquery.multiselect2side.js')}"></script>
    <script type="text/javascript">
    var chart;

    function monthDiff(d1, d2) {
        var months;
        months = (d2.getFullYear() - d1.getFullYear()) * 12;
        months -= d1.getMonth() + 1;
        months += d2.getMonth();
        return months <= 0 ? 0 : months;
    }

    function getFecha(anio, mes, dia) {
        console.log(moment([parseInt(anio), parseInt(mes), parseInt(dia)]).format());
        if ( moment([parseInt(anio), parseInt(mes), parseInt(dia)]).isValid()) {
            return new Date(anio, mes, dia);
        }
        return null
    }

    function requestData() {
        //yyyy/mm/01
        var params = {};
        params.fechaInicio = getFecha($("#fechaInicio_year").val(), $("#fechaInicio_month").val() - 1, $("#fechaInicio_day").val())
        params.fechaFin = getFecha($("#fechaFin_year").val(), $("#fechaFin_month").val() - 1, $("#fechaFin_day").val())
        params.cant_platos = 20
        params.subrubros = []
        $("#rubrosYSubrubrosms2side__dx option").each(function(){
            var val = $(this).val().split("-");
            var ids = [];
            if (val.length == 3) {
                ids.push(val[2])
            } else {
                var rubroId = val[1]
                $("#rubrosYSubrubros option").each(function(){
                    var subrubroVal = $(this).val().split("-");
                    if (subrubroVal.length == 3 && subrubroVal[1] == rubroId) {
                        ids.push(subrubroVal[2])
                    }
                });
            }
            for (var i = 0; i < ids.length; i++){
                params.subrubros.push(ids[i])
            }
        });
        params.subrubros = JSON.stringify(params.subrubros)
        /*
        Aca en params falta pasarle un listado de subrubros
        */
        if (validarFechas(params.fechaInicio, params.fechaFin) && params.subrubros != "[]") {
            $("#pdfButton").removeClass("hide");
            $("#highcharts-report").removeClass("hide");
            $.ajax({
                url: 'getDatosReporteProductos',
                type: "POST",
                data: params,
                success: function(datos) {
                    chart = buildChart('Ranking de Productos', datos, params);
                },
                cache: false
            });
        }
    }

    function downloadPDF() {
        $('#svg').val($('.highcharts-container').html());
        $("#formReporte").submit();
    }

    function buildChart(titulo, datos, params) {
        var hoy = new Date();
        report_height = 500 + 25 * datos.length;
        Highcharts.tableValuePrefix = '';
        Highcharts.xTitle = "Plato";
        Highcharts.yTitle = "Cantidad";
        Highcharts.dateFormat = "DD MMMM [de] YYYY";
        Highcharts.decimal = false;
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
        if (!fechaIni) {
            $('#errorAlert').show();
            $('#errorMessage').text("Fecha inválida: Fecha Inicio no corresponde a una fecha válida");
            return false;
        }
        if (!fechaFin) {
            $('#errorAlert').show();
            $('#errorMessage').text("Fecha inválida: Fecha Fin no corresponde a una fecha válida");
            return false;
        }
        if (fechaFin < fechaIni) {
            $('#errorAlert').show();
            $('#errorMessage').text("Fecha inválida: Fecha Fin debe ser posterior a Fecha Inicio");
            return false;
        }
        if (monthDiff(fechaIni, fechaFin) > 12) {
            $('#errorAlert').show();
            $('#errorMessage').text("Periodo inválido: El periodo comprendido entre Fecha Inicio - Fecha Fin debe ser menor o igual a los 12 meses");
            return false;
        }
        return true;
    }

    function hideError() {
        $('#errorAlert').hide();
    }

    function itemCompare(a, b) {
        var compA = $(a).val().split("-");
        var compB = $(b).val().split("-");
        var textA = $(a).text().toUpperCase();
        var textB = $(b).text().toUpperCase();
        return (compA[0] < compB[0]) ? -1 : (compA > compB) ? 1 : (textA < textB) ? -1 : (textA > textB) ? 1 : 0;
    }

    window.onload = function() {
        $("#buscarButton").click( requestData );
        $('#fechaInicio_year').addClass('form-control');
        $('#fechaInicio_month').addClass('form-control');
        $('#fechaInicio_day').addClass('form-control');
        $('#fechaFin_year').addClass('form-control');
        $('#fechaFin_month').addClass('form-control');
        $('#fechaFin_day').addClass('form-control');
        $('#rubrosYSubrubros').multiselect2side({
            selectedPosition: 'right',
            moveOptions: false,
            labelsx: '',
            labeldx: '',
            autoSort: true,
            autoSortAvailable: true,
            sortFunction: itemCompare
        });
    }
    </script>
</head>

<body>
    <div id="errorAlert" class="alert alert-danger alert-dismissable" style="display: none;">
       	<span id="errorMessage"></span>
    </div>
    <div class="">
        <ul id="Menu" class="nav nav-tabs">
            <li class="active">
                <a href="/rom/promocion/list"><i class="glyphicon glyphicon-th-list"></i> Reporte de Productos</a>
            </li>
        </ul>
    </div>
    <br/>
    <section id="list-orden" class="first">
        <div class="panel panel-default tab-content">
            <div class="panel-body">
                <div class="row form-inline">
                    <div class="form-group col-md-5 form-horizontal col-md-offset-1">
                        <label for="fechaInicio" class="col-md-3 control-label" style="padding-left:0px; text-align: left;">Fecha Inicio</label>
                        <div>
                            <g:datePicker id="fechaInicio" name="fechaInicio" precision="day" class="form-control"/>
                        </div>
                    </div>
                    <div class="form-group col-md-5 form-horizontal">
                        <label for="fechaInicio" class="col-md-3 control-label" style="padding-left:0px; text-align: left;">Fecha Fin</label>
                        <div>
                            <g:datePicker class="form-control" name="fechaFin" precision="day"  />
                        </div>
                    </div>
                </div>
                <br/>
                <div class="row col-md-7 center-block" style="float: none;">
                    <g:select optionKey="id" optionValue="nombre" name="rubrosYSubrubros" from="${rubrosYSubrubros}" />
                </div>
                <br/>
                <div class="row" style="padding-bottom:10px">
                    <div class="col-md-2 text-center col-md-offset-2">
                        <input id="buscarButton" type="button" class="btn btn-primary" value="Generar" />
                    </div>
                    <div class="col-md-2 text-center col-md-offset-4">
                        <g:form id="formReporte" action="generarPdf" class="form-horizontal" name="formReporte">
                            <input id="svg" name="svg" type="hidden" value=""/>
                            <g:submitButton id="pdfButton" name="pdfButton" type="button" class="btn btn-primary hide" value="PDF" onclick="downloadPDF()"/>
                        </g:form>
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