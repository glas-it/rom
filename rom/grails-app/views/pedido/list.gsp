
<%@ page import="rom.Pedido" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'orden.label', default: 'Orden')}" />
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
			
				<td>${pedidoInstance.estado.nombre}</td>
			
				<td>${fieldValue(bean: pedidoInstance, field: "comensales")}</td>
			
				<td>${pedidoInstance.ordenes.size()}</td>
				
				<td>
					<g:link action="anular" id="${pedidoInstance.id}">
						<i class="glyphicon glyphicon-remove"></i>
					</g:link>
					<g:link action="show" id="${pedidoInstance.id}">
						<i class="glyphicon glyphicon-usd"></i>
					</g:link>
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
