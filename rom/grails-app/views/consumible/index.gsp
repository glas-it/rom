
<%@ page import="rom.Consumible" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'consumible.label', default: 'Consumible')}" />
	<title><g:message code="default.index.label" args="[entityName]" /></title>
</head>

<body>

<section id="index-consumible" class="first">

	<table class="table table-bordered margin-top-medium">
		<thead>
			<tr>
			
				<g:sortableColumn property="nombre" title="${message(code: 'consumible.nombre.label', default: 'Nombre')}" />
			
				<g:sortableColumn property="descripcion" title="${message(code: 'consumible.descripcion.label', default: 'Descripcion')}" />
			
				<th><g:message code="consumible.subrubro.label" default="Subrubro" /></th>
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${consumibleInstanceList}" status="i" var="consumibleInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link action="show" id="${consumibleInstance.id}">${fieldValue(bean: consumibleInstance, field: "nombre")}</g:link></td>
			
				<td>${fieldValue(bean: consumibleInstance, field: "descripcion")}</td>
			
				<td>${fieldValue(bean: consumibleInstance, field: "subrubro")}</td>
			
			</tr>
		</g:each>
		</tbody>
	</table>
	<div>
		<bs:paginate total="${consumibleInstanceCount}" />
	</div>
</section>

</body>

</html>
