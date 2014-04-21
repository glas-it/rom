
<%@ page import="rom.Mesa" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'mesa.label', default: 'Mesa')}" />
	<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>

<body>

<section id="list-mesa" class="first">

	<table class="table table-bordered margin-top-medium">
		<thead>
			<tr>
				<g:sortableColumn property="numero" title="${message(code: 'mesa.numero.label', default: 'Numero')}" />
			
				<g:sortableColumn property="capacidad" title="${message(code: 'mesa.capacidad.label', default: 'Capacidad')}" />
				
				<th>${message(code: 'mesa.activo.label', default: 'Activo')} </th>
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${mesaInstanceList}" status="i" var="mesaInstance">
			<tr class="${mesaInstance.activo ? 'success' : 'danger'}">
			
				<td><g:link action="show" id="${mesaInstance.id}">${fieldValue(bean: mesaInstance, field: "numero")}</g:link></td>
			
				<td>${fieldValue(bean: mesaInstance, field: "capacidad")}</td>
							
				<td>${mesaInstance.activo ? "Si" : "No"}</td>
			
			</tr>
		</g:each>
		</tbody>
	</table>
	<div>
		<bs:paginate total="${mesaInstanceCount}" />
	</div>
</section>

</body>

</html>
