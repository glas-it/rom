
<%@ page import="rom.Pedido" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'pedido.label', default: 'Pedido')}" />
	<title><g:message code="default.list.label" args="[entityName]" /></title>
	<script src="${resource(dir:'js',file: 'moment-with-langs.min.js')}"></script>
	<g:set var="layout_nosecondarymenu" value="false" scope="request"/>
	<script type="text/javascript">

	    function getFecha(anio, mes, dia) {
	        if ( moment([parseInt(anio), parseInt(mes) - 1, parseInt(dia)]).isValid()) {
	            return new Date(anio, mes, dia);
	        }
	        return null
	    }

	   /* function validarFiltro() {
	    	fecha = getFecha($('#fecha_year').val(), $('#fecha_month').val(), $('#fecha_day').val());
	    	if (fecha) {
	    		$('#filterForm').submit();
	    	} else {
	            $('#errorAlert').removeClass("hide");
	            $('#errorAlert').text("Fecha inválida: Fecha no corresponde a una fecha válida");
	            return false;
	    	}
	    }*/

	    window.onload = function() {
	        $('#fecha_year').addClass('form-control');
	        $('#fecha_month').addClass('form-control');
	        $('#fecha_day').addClass('form-control');
    	}
	</script>
</head>
<div id="errorAlert" class="alert alert-danger hide"></div>
<div class="">
    <ul id="Menu" class="nav nav-tabs">
        <li class="active">
        	<a href="/rom/promocion/list"><i class="glyphicon glyphicon-th-list"></i> Lista Pedido</a>
        </li>
    </ul>
</div>
<br/>
<section id="list-orden" class="first">
	<div class="panel panel-default tab-content">
		<div class="panel-body fromFilter">
			<g:form name="filterForm" method="GET" action="filter">
				<div class="row form-inline">
					<div class="form-group col-md-5 form-horizontal col-md-offset-2">
						<label for="fechaInicio" class="col-md-3 control-label" style="padding-left:0px; text-align: left;">Fecha</label>
						<div>
							<input type="date" class="form-control" name="fecha" precision="day" value="${pedidoFilter?.fecha?.format('yyyy-MM-dd')}"/>
						</div>
					</div>
					<div class="form-group col-md-5 form-horizontal">
						<label for="fechaInicio" class="col-md-3 control-label" style="padding-left:0px; text-align: left;">Estado</label>
						<div class="col-md-8">
							<g:select class="form-control" id="estados" name="nombreEstado" from="${estadosList}" value="${pedidoFilter?.estado?.nombre}" optionKey="nombre" optionValue="nombre" required="" noSelection="[null: ' - ']"/>
						</div>
					</div>
				</div>
				
				<br/>
			<div class="row" style="padding-bottom:10px">
                    <div class="col-md-2 text-center col-md-offset-2">
                        <g:submitButton class="btn btn-primary" name="buscar" value="Buscar"/>
                    </div>
                </div>
			</g:form>
				
	<br/>
	<table class="table table-bordered table-striped margin-top-medium">
		<thead>
			<tr>
				<th>Mozo</th>

				<th>Mesa</th>

				<th><g:message code="pedido.estado.label" default="Estado" /></th>

				<th><g:message code="pedido.comensales.label" default="Comensales" /></th>

				<th><g:message code="pedido.ordenes.label" default="Cantidad de órdenes" /></th>

				<th>Fecha de pago</th>

				<th width="100">Acciones</th>
			</tr>
		</thead>
		<tbody>
		<g:each in="${pedidoInstanceList}" status="i" var="pedidoInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">

				<td>${pedidoInstance.mozo.nombre}</td>

				<td>${pedidoInstance.mesa.numero}</td>

				<td>${pedidoInstance.estado.nombre}</td>

				<td>${fieldValue(bean: pedidoInstance, field: "comensales")}</td>

				<td>${pedidoInstance.ordenes.size()}</td>

				<td>${pedidoInstance.fechaPago ? pedidoInstance.fechaPago.format("dd/MM/yyyy") : "-"}</td>

				<td><div class="row">
					<g:if test="${!pedidoInstance.anulado()}">
						<div class="col-md-1">
						<g:render template="/_common/modals/botonAnular" model="[item: pedidoInstance]"/>
						</div>
					</g:if>
					<g:if test="${pedidoInstance.cerrado()}">
						<div class="col-md-1">
						<g:render template="/_common/modals/botonPagar" model="[item: pedidoInstance]"/>
						</div>
					</g:if>
					<g:if test="${pedidoInstance.cerrado() || pedidoInstance.pagado()}">
						<div class="col-md-1">
						<g:link action="ticket" id="${pedidoInstance.id}">
							<i class="glyphicon glyphicon-print"></i>
						</g:link>
						</div>
					</g:if>
				</div></td>
			</tr>
		</g:each>
		</tbody>
	</table>
	</div>
	</div>
	<div>
		<bs:paginate action="${pedidoInstanceAction}" params="[fecha: pedidoFilter?.fecha?.format('yyyy-MM-dd'), nombreEstado: pedidoFilter?.estado?.nombre]" total="${pedidoInstanceCount}" />
	</div>
</section>

</body>

</html>
