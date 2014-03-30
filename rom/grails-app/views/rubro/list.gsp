
<%@ page import="rom.Rubro" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'rubro.label', default: 'Rubro')}" />
	<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>

<body>

<section id="list-rubro" class="first">

	<table class="table table-bordered margin-top-medium">
		<thead>
			<tr>
			
				<g:sortableColumn property="descripcion" title="${message(code: 'rubro.descripcion.label', default: 'Descripcion')}" />
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${rubroInstanceList}" status="i" var="rubroInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link action="show" id="${rubroInstance.id}">${fieldValue(bean: rubroInstance, field: "descripcion")}</g:link></td>
			
			</tr>
		</g:each>
		</tbody>
	</table>
	<div>
		<bs:paginate total="${rubroInstanceCount}" />
	</div>
</section>

</body>

</html>
