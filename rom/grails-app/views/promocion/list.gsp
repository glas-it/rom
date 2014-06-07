
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
						<g:sortableColumn property="nombre" title="${message(code: 'promocion.nombre.label', default: 'Nombre')}"/>
						<g:sortableColumn property="porcentajeDescuento" title="${message(code: 'promocion.porcentajeDescuento.label', default: 'Descuento (%)')}"/>
						<g:sortableColumn property="fechaInicio" title="${message(code: 'promocion.fechaInicio.label', default: 'Fecha de inicio')}"/>
						<g:sortableColumn property="fechaFin" title="${message(code: 'promocion.fechaFin.label', default: 'Fecha de finalización')}"/>
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
						<td width="100">
							<div class="row">
								<div class="col-md-2">
									<g:link action="show" id="${promocionInstance.id}">
										<i class="glyphicon glyphicon-search"></i>
									</g:link>
								</div>
								<div class="col-md-2">
									<g:link action="edit" id="${promocionInstance.id}">
										<i class="glyphicon glyphicon-pencil"></i>
									</g:link>
								</div>
								<div class="col-md-2">
									<g:link action="delete" id="${promocionInstance.id}">
										<i class="glyphicon glyphicon-remove"></i>
									</g:link>
								</div>
							</div>
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
