
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
						<th>${message(code: 'promocion.nombre.label', default: 'Nombre')}</th>
						<th>${message(code: 'promocion.porcentajeDescuento.label', default: 'Porcentaje Descuento')}(%)</th>
						<th>${message(code: 'promocion.fechaInicio.label', default: 'Fecha Inicio')}</th>
						<th>${message(code: 'promocion.fechaFin.label', default: 'Fecha Fin')}</th>					
						<th>${message(code: 'default.acciones.label', default:'Acciones')}</th>
					</tr>
				</thead>
				<tbody>
				<g:each in="${promocionInstanceList}" status="i" var="promocionInstance">
					<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
						<td>${promocionInstance.nombre}</td>
						<td>${fieldValue(bean: promocionInstance, field: "porcentajeDescuento")}%</td>
						<td><g:formatDate format="yyyy-MM-dd" date="${promocionInstance.fechaInicio}"/></td>
						<td><g:formatDate format="yyyy-MM-dd" date="${promocionInstance.fechaFin}" /></td>
						<td>
							<g:link action="show" id="${promocionInstance.id}">
								<i class="glyphicon glyphicon-search"></i>
							</g:link>
						</td>
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
