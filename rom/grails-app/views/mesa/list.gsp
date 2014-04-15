
<%@ page import="rom.Mesa" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'mesa.label', default: 'Mesa')}" />
	<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>

<body>

<section id="list-mesa" class="first">

	<table class="table table-bordered margin-top-medium">
		<thead>
			<tr>
			
				<g:sortableColumn property="activo" title="${message(code: 'mesa.activo.label', default: 'Activo')}" />
			
				<g:sortableColumn property="capacidad" title="${message(code: 'mesa.capacidad.label', default: 'Capacidad')}" />
			
				<g:sortableColumn property="numero" title="${message(code: 'mesa.numero.label', default: 'Numero')}" />
			
				<th><g:message code="mesa.restaurant.label" default="Restaurant" /></th>
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${mesaInstanceList}" status="i" var="mesaInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link action="show" id="${mesaInstance.id}">${fieldValue(bean: mesaInstance, field: "activo")}</g:link></td>
			
				<td>${fieldValue(bean: mesaInstance, field: "capacidad")}</td>
			
				<td>${fieldValue(bean: mesaInstance, field: "numero")}</td>
			
				<td>${fieldValue(bean: mesaInstance, field: "restaurant")}</td>
			
			</tr>
		</g:each>
		</tbody>
	</table>
	<div>
		<bs:paginate total="${mesaInstanceCount}" />
	</div>
</section>

</body>

</html>
