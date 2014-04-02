
<%@ page import="rom.Subrubro" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'subrubro.label', default: 'Subrubro')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>

<body>

<section id="show-subrubro" class="first">

	<table class="table">
		<tbody>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="subrubro.nombre.label" default="Nombre" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: subrubroInstance, field: "nombre")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="subrubro.rubro.label" default="Rubro" /></td>
				
				<td valign="top" class="value"><g:link controller="rubro" action="show" id="${subrubroInstance?.rubro?.id}">${subrubroInstance?.rubro?.encodeAsHTML()}</g:link></td>
				
			</tr>
		
		</tbody>
	</table>
</section>

</body>

</html>
