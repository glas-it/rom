
<%@ page import="rom.Rubro" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'rubro.label', default: 'Rubro')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>

<body>

<section id="show-rubro" class="first">

	<table class="table">
		<tbody>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="rubro.nombre.label" default="Nombre" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: rubroInstance, field: "nombre")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="rubro.orden.label" default="Orden" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: rubroInstance, field: "orden")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="rubro.subrubros.label" default="Subrubros" /></td>
				
				<td valign="top" style="text-align: left;" class="value">
					<ul>
					<g:each in="${rubroInstance.subrubros}" var="s">
						<li><g:link controller="subrubro" action="show" id="${s.id}">${s?.encodeAsHTML()}</g:link></li>
					</g:each>
					</ul>
				</td>
				
			</tr>
		
		</tbody>
	</table>
</section>

</body>

</html>
