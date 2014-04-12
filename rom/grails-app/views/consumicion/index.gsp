
<%@ page import="rom.Consumicion" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'consumicion.label', default: 'Consumicion')}" />
	<title><g:message code="default.index.label" args="[entityName]" /></title>
</head>

<body>

<section id="index-consumicion" class="first">


	<script type="text/javascript">
	$(document).ready(function() {
		if ($('.prev.disabled') !== undefined)
			$('.prev.disabled').hide()
		if ($('.next.disabled') !== undefined)
			$('.next.disabled').hide()
	})
	</script>
	<table class="table table-bordered margin-top-medium">
		<thead>
			<tr>
			
				<g:sortableColumn property="nombre" title="${message(code: 'consumicion.nombre.label', default: 'Nombre')}" />
			
				<g:sortableColumn property="descripcion" title="${message(code: 'consumicion.descripcion.label', default: 'Descripción')}" />
			
				<g:sortableColumn property="precio" title="${message(code: 'consumicion.precio.label', default: 'Precio')}" />
			
				<th><g:message code="subrubro.label" default="Sububro" /></th>
				
				<th><g:message code="subrubro.rubro.label" default="Rubro" /></th>
				
			</tr>
		</thead>
		<tbody>
		<g:each in="${consumicionInstanceList}" status="i" var="consumicionInstance">
			<tr class="${consumicionInstance.activo == true ? 'even' : 'odd'}">
			
				<td><g:link action="show" id="${consumicionInstance.id}">${fieldValue(bean: consumicionInstance, field: "nombre")}</g:link></td>

				<td>${fieldValue(bean: consumicionInstance, field: "descripcion")}</td>
			
				<td>${consumicionInstance.getPrecioFormateado()}</td>
				
				<td>${fieldValue(bean: consumicionInstance, field: "subrubro")}</td>
				
				<td>${consumicionInstance.subrubro.rubro}</td>
			
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
