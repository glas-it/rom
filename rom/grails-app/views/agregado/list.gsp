
<%@ page import="rom.Agregado" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'agregado.label', default: 'Agregado')}" />
	<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>

<body>

<section id="list-agregado" class="first">
	<table class="table table-bordered margin-top-medium">
		<thead>
			<tr>
			
				<g:sortableColumn property="nombre" title="${message(code: 'agregado.nombre.label', default: 'Nombre')}" />
			
				<g:sortableColumn property="precio" title="${message(code: 'agregado.precio.label', default: 'Precio')}" />
			
				<g:sortableColumn property="descripcion" title="${message(code: 'agregado.descripcion.label', default: 'Descripcion')}" />
			
				<th><g:message code="subrubro.label" default="Sububro" /></th>
				
				<th><g:message code="subrubro.rubro.label" default="Rubro" /></th>
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${agregadoInstanceList}" status="i" var="agregadoInstance">
				<tr class="${agregadoInstance.activo == true ? 'even' : 'odd'}">
			
				<td style="overflow: hidden;"><g:link action="show" id="${agregadoInstance.id}">${fieldValue(bean: agregadoInstance, field: "nombre")}</g:link></td>
			
				<td>${agregadoInstance.getPrecioFormateado()}</td>
			
				<td>${fieldValue(bean: agregadoInstance, field: "descripcion")}</td>
			
				<td>${fieldValue(bean: agregadoInstance, field: "subrubro")}</td>
				
				<td>${agregadoInstance.subrubro.rubro}</td>
			
			</tr>
		</g:each>
		</tbody>
	</table>
	<div>
		<bs:paginate total="${agregadoInstanceCount}" />
	</div>
</section>

</body>

</html>
