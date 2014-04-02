
<%@ page import="rom.Consumicion" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'consumicion.label', default: 'Consumicion')}" />
	<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>

<body>

<section id="list-consumicion" class="first">

	<table class="table table-bordered margin-top-medium">
		<thead>
			<tr>
			
				<g:sortableColumn property="nombre" title="${message(code: 'consumicion.nombre.label', default: 'Nombre')}" />
			
				<g:sortableColumn property="descripcion" title="${message(code: 'consumicion.descripcion.label', default: 'Descripcion')}" />
			
				<g:sortableColumn property="descripUno" title="${message(code: 'consumicion.descripUno.label', default: 'Descrip Uno')}" />
			
				<g:sortableColumn property="descripDos" title="${message(code: 'consumicion.descripDos.label', default: 'Descrip Dos')}" />
			
				<g:sortableColumn property="descripTres" title="${message(code: 'consumicion.descripTres.label', default: 'Descrip Tres')}" />
			
				<g:sortableColumn property="descripCuatro" title="${message(code: 'consumicion.descripCuatro.label', default: 'Descrip Cuatro')}" />
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${consumicionInstanceList}" status="i" var="consumicionInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link action="show" id="${consumicionInstance.id}">${fieldValue(bean: consumicionInstance, field: "nombre")}</g:link></td>
			
				<td>${fieldValue(bean: consumicionInstance, field: "descripcion")}</td>
			
				<td>${fieldValue(bean: consumicionInstance, field: "descripUno")}</td>
			
				<td>${fieldValue(bean: consumicionInstance, field: "descripDos")}</td>
			
				<td>${fieldValue(bean: consumicionInstance, field: "descripTres")}</td>
			
				<td>${fieldValue(bean: consumicionInstance, field: "descripCuatro")}</td>
			
			</tr>
		</g:each>
		</tbody>
	</table>
	<div>
		<bs:paginate total="${consumicionInstanceCount}" />
	</div>
</section>

</body>

</html>
