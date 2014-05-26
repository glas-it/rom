
<%@ page import="rom.Pedido" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'pedido.label', default: 'Pedido')}" />
	<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>

<body>
<script type="text/javascript">
	$(document).ready(function() {
		$('#Menu').hide();
		if ($('.prev.disabled') !== undefined)
			$('.prev.disabled').hide()
		if ($('.next.disabled') !== undefined)
			$('.next.disabled').hide()
		
	});
</script>
	

<section id="list-orden" class="first">
	<div class="panel panel-default tab-content">
	<div class="panel-body">
	<div class="fromFilter">
		<g:form method="GET" action="filter">
			<div class="row">
				<div class="col-md-2">
					Fecha
				</div>
				<div class="col-md-4">
					<g:datePicker class="form-control" name="fecha" precision="day"/>
				</div>
				<div class="col-md-2">
					Estado
				</div>
				<div class="col-md-4">
					<g:select class="form-control" id="estados" name="nombreEstado" from="${estadosList}" optionKey="nombre" optionValue="nombre" required="" noSelection="[null: ' - ']"/>
				</div>
			</div>
			<g:submitButton name="buscar" value="buscar"/>
		</g:form>
	</div>
	<table class="table table-bordered margin-top-medium">
		<thead>
			<tr>			
				<th>Mozo</th>
				
				<th>Mesa</th>		
				
				<th><g:message code="pedido.estado.label" default="Estado" /></th>
				
				<th><g:message code="pedido.comensales.label" default="Comensales" /></th>
			
				<th><g:message code="pedido.ordenes.label" default="Cantidad de órdenes" /></th>

				<th>Acciones</th>			
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
				
				<td>
					<g:if test="${!pedidoInstance.anulado()}">
						<g:render template="/_common/modals/botonAnular" model="[item: pedidoInstance]"/>
					</g:if>
					<g:if test="${pedidoInstance.cerrado()}">
						<g:render template="/_common/modals/botonPagar" model="[item: pedidoInstance]"/>
					</g:if>
					<g:if test="${pedidoInstance.cerrado() || pedidoInstance.pagado()}">
						<g:link action="ticket" id="${pedidoInstance.id}">
							<i class="glyphicon glyphicon-print"></i>Ticket
						</g:link>
					</g:if>
				</td>
			</tr>
		</g:each>
		</tbody>
	</table>
	</div>
	</div>
	<div>
		<bs:paginate total="${pedidoInstanceCount}" />
	</div>
</section>

</body>

</html>
