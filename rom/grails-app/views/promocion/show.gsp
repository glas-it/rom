
<%@ page import="rom.Promocion" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'promocion.label', default: 'Promocion')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>

<body>

<script type="text/javascript">
	$(document).ready(function () {
		$("#DeleteAction").hide()
	});
</script>

<section id="show-promocion" class="first">
	<div class="panel panel-default tab-content col-md-8">
		<div class="panel-body">
			<div class="table-responsive">
				<table class="table table-bordered table-striped table-responsive">
					<tbody>
						<tr class="prop">
							<td valign="top" class="name"><g:message code="promocion.nombre.label" default="Nombre" /></td>
							<td valign="top" class="value">${promocionInstance?.nombre}</td>
						</tr>
						<tr class="prop">
							<td valign="top" class="name"><g:message code="promocion.descripcion.label" default="Descripcion" /></td>
							<td valign="top" class="value">${promocionInstance?.descripcion}</td>
						</tr>
						<tr class="prop">
							<td valign="top" class="name"><g:message code="promocion.fechaInicio.label" default="Fecha Inicio" /></td>
							<td valign="top" class="value"><g:formatDate format="yyyy-MM-dd" date="${promocionInstance?.fechaInicio}" /></td>
						</tr>
						<tr class="prop">
							<td valign="top" class="name"><g:message code="promocion.fechaFin.label" default="Fecha Fin" /></td>
							<td valign="top" class="value"><g:formatDate format="yyyy-MM-dd" date="${promocionInstance?.fechaFin.clearTime()}" /></td>
						</tr>
						<tr class="prop">
							<td valign="top" class="name"><g:message code="promocion.porcentajeDescuento.label" default="Porcentaje Descuento" /></td>
							<td valign="top" class="value">${fieldValue(bean: promocionInstance, field: "porcentajeDescuento")}</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</div>
	<div class="panel panel-default tab-content col-md-4">
		<div class="panel-body">
			<div class="">
				<div class="panel panel-default">
					<div class="panel-heading">
						QR
					</div>
					<div class="panel-body">
						<qrcode:image text="${promocionInstance?.id}&${promocionInstance?.nombre}&${promocionInstance?.fechaInicio.time}&${promocionInstance?.fechaFin.time}"/>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
</body>
</html>
