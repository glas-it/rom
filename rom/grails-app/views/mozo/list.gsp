
<%@ page import="rom.Mozo" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'mozo.label', default: 'Mozo')}" />
	<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>

<body>

<section id="list-mozo" class="first">
	<div class="panel panel-default tab-content">
		<div class="panel-body">
			<table class="table table-striped table-bordered margin-top-medium">
				<thead>
					<tr>
						<g:sortableColumn property="numeroLegajo" title="${message(code: 'mozo.numeroLegajo.label', default: 'N° legajo')}"
						/>
						<g:sortableColumn property="nombre" title="${message(code: 'mozo.nombre.label', default: 'Nombre')}" />
						<g:sortableColumn property="apellido" title="${message(code: 'mozo.apellido.label', default: 'Apellido')}" />
						<th><g:message code='mozo.activo.label'  default= 'Activo'/> </th>
						<th>${message(code: 'default.acciones.label', default:'Acciones')}</th>
					</tr>
				</thead>
				<tbody>
				<g:each in="${mozoInstanceList}" status="i" var="mozoInstance">
					<tr>
						<td><g:link action="show" id="${mozoInstance.id}"> ${fieldValue(bean: mozoInstance, field: "numeroLegajo")} </g:link></td>
						<td> ${fieldValue(bean: mozoInstance, field: "nombre")}</td>
						<td>${fieldValue(bean: mozoInstance, field: "apellido")}</td>
						<td>${mozoInstance.activo ? "Si" : "No"}</td>
						<td width="100">
							<div class="row">
								<div class="col-md-1">
									<g:link action="show" id="${mozoInstance.id}">
										<i class="glyphicon glyphicon-search"></i>
									</g:link>
								</div>
								<div class="col-md-1">
									<g:link action="edit" id="${mozoInstance.id}">
										<i class="glyphicon glyphicon-pencil"></i>
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
		<bs:paginate total="${mozoInstanceCount}" />
	</div>
</section>

</body>

</html>
