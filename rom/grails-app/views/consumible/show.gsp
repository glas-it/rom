
<%@ page import="rom.Consumible" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'consumible.label', default: 'Consumible')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>

<body>

<section id="show-consumible" class="first">

	<table class="table">
		<tbody>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="consumible.nombre.label" default="Nombre" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: consumibleInstance, field: "nombre")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="consumible.descripcion.label" default="Descripcion" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: consumibleInstance, field: "descripcion")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="consumible.precio.label" default="Precio" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: consumibleInstance, field: "precio")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="consumible.activo.label" default="Activo" /></td>
				
				<td valign="top" class="value"><g:formatBoolean boolean="${consumibleInstance?.activo}" /></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="consumible.subrubro.label" default="Subrubro" /></td>
				
				<td valign="top" class="value"><g:link controller="subrubro" action="show" id="${consumibleInstance?.subrubro?.id}">${consumibleInstance?.subrubro?.encodeAsHTML()}</g:link></td>
				
			</tr>
		
		</tbody>
	</table>
</section>

</body>

</html>
