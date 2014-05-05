
<%@ page import="rom.Agregado" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'agregado.label', default: 'Agregado')}" />
	<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>

<body>

	<script type="text/javascript">
		$(document).ready(function() {
			if ($('.prev.disabled') !== undefined)
				$('.prev.disabled').hide()
			if ($('.next.disabled') !== undefined)
				$('.next.disabled').hide()
		})
	</script>

<section id="list-agregado" class="first">
	<div class="panel panel-default tab-content">
	<table class="table table-bordered margin-top-medium">
		<thead>
			<tr>
			
				<g:sortableColumn property="nombre" title="${message(code: 'agregado.nombre.label', default: 'Nombre')}" />
			
				<g:sortableColumn property="precio" title="${message(code: 'agregado.precio.label', default: 'Precio')}" />
			
				<g:sortableColumn property="descripcion" title="${message(code: 'agregado.descripcion.label', default: 'Descripcion')}" />
			
				<th><g:message code="subrubro.label" default="Sububro" /></th>
				
				<th><g:message code="subrubro.rubro.label" default="Rubro" /></th>
				<th><g:message code="acciones.label" default="Acciones"/></th>
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
				
				<td><g:link action="show" id="${agregadoInstance.id}"><i class="glyphicon glyphicon-search"/></g:link></td>
			
			</tr>
		</g:each>
		</tbody>
	</table>
	</div>
	<div>
		<bs:paginate total="${agregadoInstanceCount}" />
	</div>
</section>

</body>

</html>
