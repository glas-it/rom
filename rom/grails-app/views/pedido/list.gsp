
<%@ page import="rom.Pedido" %>
<%@ page import="rom.PedidoStates.*" %>
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
	<g:form action="filter" method="GET" class="form-horizontal" role="form" >
		
		<div class="row form-group" >
			<div class="col-md-1">
				<label for="estado" class="control-label">Estado</label>
			</div>
			<div class="col-md-3">
				<g:select class="form-control" id="estadoNombre" name="estadoNombre"
				 from="${[PedidoStateAbierto.ABIERTO, PedidoStateCerrado.CERRADO,
					 PedidoStatePagado.PAGADO, PedidoStateAnulado.ANULADO]}" class="form-control many-to-one"
				 noSelection="['':'Seleccione un estado']"/>
			</div>
			<div class="col-md-1">
				<label for="fecha" class="control-label">Fecha</label>
			</div>
			<div class="col-md-3">
				<g:field type="date" name="fecha" value="${formatDate(format:'dd-MM-yyyy',date:new Date())}" />
			</div>
		</div>
		<div class="form-actions margin-top-medium">
			<g:submitButton name="buscar" class="btn btn-primary" value="${message(code: 'default.button.buscar.label', default: 'Buscar')}"/>
		</div>
			
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
	<div>
		<bs:paginate total="${pedidoInstanceCount}" />
	</div>
</section>

</body>

</html>
