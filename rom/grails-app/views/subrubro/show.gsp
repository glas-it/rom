
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
				<td valign="top" class="name"><g:message code="subrubro.orden.label" default="Orden" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: subrubroInstance, field: "orden")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="subrubro.consumiciones.label" default="Consumiciones" /></td>
				
				<td valign="top" style="text-align: left;" class="value">
					<ul>
					<g:each in="${subrubroInstance.consumiciones}" var="c">
						<li><g:link controller="consumicion" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></li>
					</g:each>
					</ul>
				</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="subrubro.agregados.label" default="Agregados" /></td>
				
				<td valign="top" style="text-align: left;" class="value">
					<ul>
					<g:each in="${subrubroInstance.agregados}" var="a">
						<li><g:link controller="agregado" action="show" id="${a.id}">${a?.encodeAsHTML()}</g:link></li>
					</g:each>
					</ul>
				</td>
				
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
