
<%@ page import="rom.Agregado" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'agregado.label', default: 'Agregado')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>

<body>

<section id="show-agregado" class="first">
	<div class="panel panel-default tab-content">
		<div class="panel-body">
			<table class="table table-striped table-bordered table-responsive">
				<tbody>
					<tr class="prop">
						<td valign="top" class="name"><g:message code="agregado.nombre.label" default="Nombre" /></td>
						<td valign="top" class="value">${fieldValue(bean: agregadoInstance, field: "nombre")}</td>
					</tr>
					<tr>
						<td valign="top" class="name"><g:message code="agregado.detalle.label" default="Detalle" /></td>
						<td valign="top" class="value">${fieldValue(bean: agregadoInstance, field: "detalle")}</td>
					</tr>
					</tr>
					<tr class="prop">
						<td valign="top" class="name"><g:message code="agregado.subrubro.label" default="Subrubro" /></td>
						<td valign="top" class="value"><g:link controller="subrubro" action="show" id="${agregadoInstance?.subrubro?.id}">${agregadoInstance?.subrubro?.encodeAsHTML()}</g:link></td>
					</tr>
					<tr class="prop">
						<td valign="top" class="name"><g:message code="agregado.activo.label" default="Activo" /></td>
						<td valign="top" class="value">${agregadoInstance?.activo ? "Si" : "No"}</td>
					</tr>
				</tbody>
			</table>
			<g:render template="/precio/show-table" model="[precioInstanceList: agregadoInstance?.precios]"/>
		</div>
	</div>
</section>
</body>
</html>
