
<%@ page import="rom.Promocion" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'promocion.label', default: 'Promocion')}" />
	<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>

<body>

<section id="list-promocion" class="first">
	<div class="panel panel-default tab-content">
		<div class="panel-body">
			<table class="table table-bordered margin-top-medium">
				<thead>
					<tr>
					
						<g:sortableColumn property="fechaInicio" title="${message(code: 'promocion.fechaInicio.label', default: 'Fecha Inicio')}" />
					
						<g:sortableColumn property="fechaFin" title="${message(code: 'promocion.fechaFin.label', default: 'Fecha Fin')}" />
					
						<g:sortableColumn property="cantidadCupones" title="${message(code: 'promocion.cantidadCupones.label', default: 'Cantidad Cupones')}" />
					
						<g:sortableColumn property="porcentajeDescuento" title="${message(code: 'promocion.porcentajeDescuento.label', default: 'Porcentaje Descuento')}" />
					
						<th><g:message code="promocion.restaurant.label" default="Restaurant" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${promocionInstanceList}" status="i" var="promocionInstance">
					<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
					
						<td><g:link action="show" id="${promocionInstance.id}">${fieldValue(bean: promocionInstance, field: "fechaInicio")}</g:link></td>
					
						<td><g:formatDate date="${promocionInstance.fechaFin}" /></td>
					
						<td>${fieldValue(bean: promocionInstance, field: "cantidadCupones")}</td>
					
						<td>${fieldValue(bean: promocionInstance, field: "porcentajeDescuento")}</td>
					
						<td>${fieldValue(bean: promocionInstance, field: "restaurant")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
		</div>
	</div>
	<div>
		<bs:paginate total="${promocionInstanceCount}" />
	</div>
</section>

</body>

</html>
