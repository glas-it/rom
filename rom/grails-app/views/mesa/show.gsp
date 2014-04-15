
<%@ page import="rom.Mesa" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'mesa.label', default: 'Mesa')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>

<body>

<section id="show-mesa" class="first">

	<table class="table table-striped table-bordered table-responsive">
		<tbody>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="mesa.activo.label" default="Activo" /></td>
				
				<td valign="top" class="value"><g:formatBoolean boolean="${mesaInstance?.activo}" /></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="mesa.capacidad.label" default="Capacidad" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: mesaInstance, field: "capacidad")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="mesa.numero.label" default="Numero" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: mesaInstance, field: "numero")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="mesa.restaurant.label" default="Restaurant" /></td>
				
				<td valign="top" class="value"><g:link controller="restaurant" action="show" id="${mesaInstance?.restaurant?.id}">${mesaInstance?.restaurant?.encodeAsHTML()}</g:link></td>
				
			</tr>
		
		</tbody>
	</table>
</section>

</body>

</html>
