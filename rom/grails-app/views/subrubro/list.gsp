
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

<script type="text/javascript">
	$(document).ready(function() {
		if ($('.prev.disabled') !== undefined)
			$('.prev.disabled').hide()
		if ($('.next.disabled') !== undefined)
			$('.next.disabled').hide()
	})
</script>

	<table class="table table-striped table-bordered margin-top-medium">
		<thead>
			<tr>
			
				<th> "${message(code: 'subrubro.nombre.label', default: 'Nombre')}" </th>
			
				<th> <g:message code="subrubro.orden.label"  default="Orden"/> </th>
			
				<th><g:message code="subrubro.rubro.label" default="Rubro" /></th>
				
				<th># Consumiciones</th>
				
				<th># Agregados</th>
			
				<th> Acciones </th>
			</tr>
		</thead>
		<tbody>
		<g:each in="${subrubroInstanceList}" status="i" var="subrubroInstance">
			<tr>
			
				<td><g:link action="show" id="${subrubroInstance.id}">${fieldValue(bean: subrubroInstance, field: "nombre")}</g:link></td>
			
				<td>${fieldValue(bean: subrubroInstance, field: "orden")}</td>
			
				<td>${fieldValue(bean: subrubroInstance, field: "rubro")}</td>
				
				<td>${subrubroInstance.consumiciones.size()}</td>
				
				<td>${subrubroInstance.agregados.size()}</td>
				<td>
					<g:if test="${i != 0}">
						<g:link class="glyphicon glyphicon-arrow-up" action="subirOrden" id="${subrubroInstance.id}"></g:link>
					</g:if>
					<g:if test="${i < subrubroInstanceList.size() - 1}">
						<g:link class="glyphicon glyphicon-arrow-down" action="bajarOrden" id="${subrubroInstance.id}"></g:link>
					</g:if>
				</td>
			
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
