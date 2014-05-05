
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
				
				<td valign="top" class="value">${fieldValue(bean: consumicionInstance, field: "nombre")}</td>
				
			</tr>
			
			<tr class="prop">
				<td valign="top" class="name"><g:message code="consumicion.descripcion.label" default="Descripcion" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: consumicionInstance.precios[0], field: "descripcion")}</td>
				
			</tr>
			
			<tr class="prop">
				<td valign="top" class="name"><g:message code="consumicion.precio.label" default="Precio" /></td>
				
				<td valign="top" class="value">${consumicionInstance?.precios[0]?.getPrecioFormateado()}</td>
				
			</tr>
			
			
			<tr class="prop" style="${fieldValue(bean: consumicionInstance.precios[1], field: "descripcion") == "" ? 'display:none' : ''}">
				
				<td valign="top" class="name"><g:message code="consumicion.descripDos.label" default="Descripción Dos" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: consumicionInstance.precios[1], field: "descripcion")}</td>
					
			</tr>
			
			<tr class="prop" style="${fieldValue(bean: consumicionInstance.precios[1], field: "valor") == "" ? 'display:none' : ''}">
				<td valign="top" class="name"><g:message code="consumicion.precioDos.label" default="Precio Dos" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: consumicionInstance.precios[1], field: "valor")}</td>
				
			</tr>
		
		
			<tr class="prop" style="${fieldValue(bean: consumicionInstance.precios[2], field: "descripcion") == "" ? 'display:none' : ''}">
				<td valign="top" class="name"><g:message code="consumicion.descripTres.label" default="Descripción Tres" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: consumicionInstance.precios[2], field: "descripcion")}</td>
				
			</tr>
		
			<tr class="prop" style="${fieldValue(bean: consumicionInstance.precios[2], field: "descripcion") == "" ? 'display:none' : ''}">
				<td valign="top" class="name"><g:message code="consumicion.precioTres.label" default="Precio Tres" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: consumicionInstance.precios[2], field: "valor")}</td>
				
			</tr>
		
		
			<tr class="prop" style="${fieldValue(bean: consumicionInstance.precios[3], field: "descripcion") == "" ? 'display:none' : ''}">
				<td valign="top" class="name"><g:message code="consumicion.descripCuatro.label" default="Descripción Cuatro" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: consumicionInstance.precios[3], field: "descripcion")}</td>
				
			</tr>
		
		
			<tr class="prop" style="${fieldValue(bean: consumicionInstance.precios[3], field: "valor") == "" ? 'display:none' : ''}">
				<td valign="top" class="name"><g:message code="consumicion.precioCuatro.label" default="Precio Cuatro" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: consumicionInstance.precios[3], field: "valor")}</td>
				
			</tr>
		
		<%--
			<tr class="prop">
				<td valign="top" class="name"><g:message code="consumicion.precios.label" default="Precios" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: consumicionInstance, field: "precios")}</td>
				
			</tr>
		 --%>
		 
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
	</div>
</section>

</body>

</html>
