
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
	<div class="panel panel-default tab-content">
		<div class="panel-body">
			<table class="table table-striped table-bordered margin-top-medium">
					<thead>
						<tr>
							<th>${message(code: 'mesa.numero.label', default: 'Numero')}</th>
							<th>${message(code: 'mesa.capacidad.label', default: 'Capacidad')} </th>
							<th>${message(code: 'mesa.activo.label', default: 'Activo')}</th>
							<th>${message(code: 'default.acciones.label', default:'Acciones')}</th>
						</tr>
					</thead>
					<tbody>
					<g:each in="${mesaInstanceList}" status="i" var="mesaInstance">
						<tr>
							<td><g:link action="show" id="${mesaInstance.id}">${fieldValue(bean: mesaInstance, field: "numero")}</g:link></td>
							<td>${fieldValue(bean: mesaInstance, field: "capacidad")}</td>
							<td>${mesaInstance.activo ? "Si" : "No"}</td>
								<td width="100">
								<div class="row">
									<div class="col-md-1">
										<g:link action="show" id="${mesaInstance.id}">
											<i class="glyphicon glyphicon-search"></i>
										</g:link>
									</div>
									<div class="col-md-1">
										<g:link action="edit" id="${mesaInstance.id}">
											<i class="glyphicon glyphicon-pencil"></i>
										</g:link>
									</div>
									<div class="col-md-1">
										<g:link action="delete" id="${mesaInstance.id}">
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
	</div>
		<div>
			<bs:paginate total="${mesaInstanceCount}" />
		</div>
</section>
</body>
</html>
