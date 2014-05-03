
<%@ page import="rom.Orden" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'orden.label', default: 'Orden')}" />
	<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>

<body>

<section id="list-orden" class="first">

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
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${ordenInstanceList}" status="i" var="ordenInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
						
				<td>${ordenInstance.pedido.mozo.username}</td>
			
				<td>${ordenInstance.estado.nombre}</td>
			
				<td>${fieldValue(bean: ordenInstance, field: "consumible")}</td>
			
				<td>${fieldValue(bean: ordenInstance, field: "agregado")}</td>
			
				<td>${ordenInstance.precio.getPrecioFormateado()}</td>
				
				<g:if test="${ordenInstance.timer.getTime("Pendiente") != 0}">
				    <td>${ordenInstance.timer.getTime("Pendiente") as int}''</td>
				</g:if>
				<g:else>
				    <td>-</td>
				</g:else>
				
				<g:if test="${ordenInstance.timer.getTime("En Preparacion") != 0}">
				    <td>${ordenInstance.timer.getTime("En Preparacion") as int}''</td>
				</g:if>
				<g:else>
				    <td>-</td>
				</g:else>
				
				<g:if test="${ordenInstance.timer.getTime("Terminado") != 0}">
				    <td>${ordenInstance.timer.getTime("Terminado") as int}''</td>
				</g:if>
				<g:else>
				    <td>-</td>
				</g:else>
			
			</tr>
		</g:each>
		</tbody>
	</table>
	<div>
		<bs:paginate total="${ordenInstanceCount}" />
	</div>
</section>

</body>

</html>
