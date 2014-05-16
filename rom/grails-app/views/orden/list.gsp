
<%@ page import="rom.Orden" %>
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
			
				<th><g:message code="orden.estado.label" default="Estado" /></th>
				
				<th><g:message code="orden.consumible.label" default="Consumible" /></th>
			
				<th><g:message code="orden.agregado.label" default="Agregado" /></th>
			
				<th><g:message code="orden.precio.label" default="Precio" /></th>
			
				<th>Pendiente</th>
			
				<th>En Preparación</th>
			
				<th>Terminado</th>
				
				<th>Acciones</th>
			</tr>
		</thead>
		<tbody>
		<g:each in="${ordenInstanceList}" status="i" var="ordenInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
						
				<td>${ordenInstance.pedido.mozo.nombre}</td>
			
				<td>${ordenInstance.estado.nombre}</td>
			
				<td>${fieldValue(bean: ordenInstance, field: "consumible")}</td>
			
				<td>${fieldValue(bean: ordenInstance, field: "agregado")}</td>
			
				<td>${ordenInstance.precio.getPrecioFormateado()}</td>
				
				<g:if test="${ordenInstance.timer.getTime("Pendiente") != 0}">
				    <td>${ordenInstance.timer.getTime("Pendiente") as int}'</td>
				</g:if>
				<g:else>
				    <td>-</td>
				</g:else>
				
				<g:if test="${ordenInstance.timer.getTime("En Preparacion") != 0}">
				    <td>${ordenInstance.timer.getTime("En Preparacion") as int}'</td>
				</g:if>
				<g:else>
				    <td>-</td>
				</g:else>
				
				<g:if test="${ordenInstance.timer.getTime("Terminado") != 0}">
				    <td>${ordenInstance.timer.getTime("Terminado") as int}'</td>
				</g:if>
				<g:else>
				    <td>-</td>
				</g:else>
				
				<td>
					<g:if test="${!ordenInstance.anulado()}">
						<g:render template="/_common/modals/botonAnular" model="[item: ordenInstance]"/>
					</g:if>					
				</td>
			</tr>
		</g:each>
		</tbody>
	</table>
	</div>
	</div>
	<div>
		<bs:paginate total="${ordenInstanceCount}" />
	</div>
</section>

</body>

</html>
