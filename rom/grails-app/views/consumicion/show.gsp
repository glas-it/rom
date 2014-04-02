
<%@ page import="rom.Consumicion" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'consumicion.label', default: 'Consumicion')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>

<body>

<section id="show-consumicion" class="first">

	<table class="table">
		<tbody>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="consumicion.nombre.label" default="Nombre" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: consumicionInstance, field: "nombre")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="consumicion.descripcion.label" default="Descripcion" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: consumicionInstance, field: "descripcion")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="consumicion.descripUno.label" default="Descrip Uno" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: consumicionInstance, field: "descripUno")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="consumicion.descripDos.label" default="Descrip Dos" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: consumicionInstance, field: "descripDos")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="consumicion.descripTres.label" default="Descrip Tres" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: consumicionInstance, field: "descripTres")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="consumicion.descripCuatro.label" default="Descrip Cuatro" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: consumicionInstance, field: "descripCuatro")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="consumicion.precioUno.label" default="Precio Uno" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: consumicionInstance, field: "precioUno")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="consumicion.precios.label" default="Precios" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: consumicionInstance, field: "precios")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="consumicion.precioCuatro.label" default="Precio Cuatro" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: consumicionInstance, field: "precioCuatro")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="consumicion.precioDos.label" default="Precio Dos" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: consumicionInstance, field: "precioDos")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="consumicion.precioTres.label" default="Precio Tres" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: consumicionInstance, field: "precioTres")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="consumicion.subrubro.label" default="Subrubro" /></td>
				
				<td valign="top" class="value"><g:link controller="subrubro" action="show" id="${consumicionInstance?.subrubro?.id}">${consumicionInstance?.subrubro?.encodeAsHTML()}</g:link></td>
				
			</tr>
		
		</tbody>
	</table>
</section>

</body>

</html>
