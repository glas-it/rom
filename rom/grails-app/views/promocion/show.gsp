
<%@ page import="rom.Promocion" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'promocion.label', default: 'Promocion')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>

<body>

<section id="show-promocion" class="first">
		<div class="row">
			<div class="col-md-8">
				<div class="panel panel-default">
					<div class="panel-heading">
						Promoción
					</div>
					<div class="panel-body">
						<table class="table table-bordered table-responsive">
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
									
									<td valign="top" class="value"><g:formatDate date="${promocionInstance?.fechaInicio}" /></td>
									
								</tr>
							
								<tr class="prop">
									<td valign="top" class="name"><g:message code="promocion.fechaFin.label" default="Fecha Fin" /></td>
									
									<td valign="top" class="value"><g:formatDate date="${promocionInstance?.fechaFin}" /></td>
									
								</tr>
							
								<tr class="prop">
									<td valign="top" class="name"><g:message code="promocion.cantidadCupones.label" default="Cantidad Cupones" /></td>
									
									<td valign="top" class="value">${fieldValue(bean: promocionInstance, field: "cantidadCupones")}</td>
									
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
			<div class="col-md-4">
				<div class="panel panel-default">
					<div class="panel-heading">
						QR
					</div>
					<div class="panel-body">
						<qrcode:image text="promocionInstance?.id"/>
					</div>
				</div>
			</div>
		</div>
</section>

</body>

</html>
