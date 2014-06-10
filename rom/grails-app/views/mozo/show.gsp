
<%@ page import="rom.Mozo" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'mozo.label', default: 'Mozo')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>

<body>
<section id="show-mozo" class="first">
	<div class="panel panel-default tab-content">
		<div class="panel-body">
			<div class="table-responsive">
				<table class="table table-striped table-bordered">
					<tbody>
						<tr class="prop">
							<td valign="top" class="name"><g:message code="mozo.numeroLegajo.label" default="N° Legajo" /></td>
							<td valign="top" class="value">${fieldValue(bean: mozoInstance, field: "numeroLegajo")}</td>
						</tr>
						<tr class="prop">
							<td valign="top" class="name"><g:message code="mozo.nombre.label" default="Nombre" /></td>
							<td valign="top" class="value">${fieldValue(bean: mozoInstance, field: "nombre")}</td>
						</tr>
						<tr class="prop">
							<td valign="top" class="name"><g:message code="mozo.apellido.label" default="Apellido" /></td>
							<td valign="top" class="value">${fieldValue(bean: mozoInstance, field: "apellido")}</td>
						</tr>
						<tr class="prop">
							<td valign="top" class="name"><g:message code="mozo.activo.label" default="Activo" /></td>
							<td valign="top" class="value">${mozoInstance.activo ? "Si" : "No"}</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</section>
</body>
</html>
