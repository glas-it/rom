
<%@ page import="rom.Restaurant" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'restaurant.label', default: 'Restaurant')}" />
	<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>

<body>

<section id="list-restaurant" class="first">

	<table class="table table-bordered margin-top-medium">
		<thead>
			<tr>
			
				<g:sortableColumn property="nombre" title="${message(code: 'restaurant.nombre.label', default: 'Nombre')}" />
			
				<th><g:message code="restaurant.usuario.label" default="Usuario" /></th>
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${restaurantInstanceList}" status="i" var="restaurantInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link action="show" id="${restaurantInstance.id}">${fieldValue(bean: restaurantInstance, field: "nombre")}</g:link></td>
			
				<td>${fieldValue(bean: restaurantInstance, field: "usuario")}</td>
			
			</tr>
		</g:each>
		</tbody>
	</table>
	<div>
		<bs:paginate total="${restaurantInstanceCount}" />
	</div>
</section>

</body>

</html>
