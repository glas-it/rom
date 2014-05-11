
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
	<div class="panel panel-default tab-content">
	<div class="panel-body">
	<table class="table table-striped table-bordered table-responsive">
		<tbody>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="consumicion.nombre.label" default="Nombre" /></td>
				
				<td valign="top" class="value">${consumicionInstance?.nombre}</td>
				
			</tr>
			
			<tr class="prop">
				<td valign="top" class="name"><g:message code="consumicion.descripcion.label" default="Descripcion" /></td>
				
				<td valign="top" class="value">${consumicionInstance?.detalle}</td>
				
			</tr> 
			<tr class="prop">
				<td valign="top" class="name"><g:message code="consumicion.subrubro.label" default="Subrubro" /></td>
				
				<td valign="top" class="value"><g:link controller="subrubro" action="show" id="${consumicionInstance?.subrubro?.id}">${consumicionInstance?.subrubro?.encodeAsHTML()}</g:link></td>
				
			</tr>
			
			<tr class="prop">
				<td valign="top" class="name"><g:message code="consumicion.activo.label" default="Activo" /></td>
				
				<td valign="top" class="value">${consumicionInstance?.activo ? "Si" : "No"}</td>
				
			</tr>
		</tbody>
	</table>
	</div>
	<g:render template="/precio/show-table" model="[precioInstanceList: consumicionInstance?.precios]" />
	</div>
</section>

</body>

</html>
