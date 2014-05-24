
<%@ page import="rom.Restaurant" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'restaurant.label', default: 'Restaurant')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>

<body>

<section id="show-restaurant" class="first">

	<table class="table">
		<tbody>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="restaurant.nombre.label" default="Nombre" /></td>
				<td valign="top" class="value">${fieldValue(bean: restaurantInstance, field: "nombre")}</td>
			</tr>
			<tr class="prop">
				<td valign="top" class="name"><g:message code="restaurant.direccion.label" default="Dirección" /></td>
				<td valign="top" class="value">${fieldValue(bean: restaurantInstance, field: "direccion")}</td>
			</tr>
			<tr class="prop">
				<td valign="top" class="name"><g:message code="restaurant.telefono.label" default="Teléfono" /></td>
				<td valign="top" class="value">${fieldValue(bean: restaurantInstance, field: "telefono")}</td>
			</tr>
			<tr class="prop">
				<td valign="top" class="name"><g:message code="restaurant.telefono.label" default="Precio Cubierto" /></td>
				<td valign="top" class="value">${fieldValue(bean: restaurantInstance, field: "precioCubierto")}</td>
			</tr>
		</tbody>
	</table>
</section>

</body>

</html>
