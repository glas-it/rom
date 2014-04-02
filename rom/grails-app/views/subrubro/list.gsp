
<%@ page import="rom.Subrubro" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'subrubro.label', default: 'Subrubro')}" />
	<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>

<body>

<section id="list-subrubro" class="first">

	<table class="table table-bordered margin-top-medium">
		<thead>
			<tr>
			
				<g:sortableColumn property="nombre" title="${message(code: 'subrubro.nombre.label', default: 'Nombre')}" />
			
				<th><g:message code="subrubro.rubro.label" default="Rubro" /></th>
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${subrubroInstanceList}" status="i" var="subrubroInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link action="show" id="${subrubroInstance.id}">${fieldValue(bean: subrubroInstance, field: "nombre")}</g:link></td>
			
				<td>${fieldValue(bean: subrubroInstance, field: "rubro")}</td>
			
			</tr>
		</g:each>
		</tbody>
	</table>
	<div>
		<bs:paginate total="${subrubroInstanceCount}" />
	</div>
</section>

</body>

</html>
