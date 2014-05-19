<%@ page import="rom.Pedido" %>
<!DOCTYPE html>
<html>

<head>
	<g:set var="entityName" value="${message(code: 'pedido.label', default: 'Pedido')}" />
	<title><g:message code="pedido.ticket.label" default="Ticket" /></title>
</head>

<body>
	<section id="show-pedido" class="first">
<%--		<g:render template="/pedido/form"--%>
<%--		/>--%>
		<div class="row">
				<div class="col-md-1">
					<g:message code="ticket.mesa.label" default="Mesa"/>
				</div>
				<div class="col-md-2">
					<g:field name="numeromesa" type="text" value="${pedidoInstance.mesa.numero}" disabled="true"/>
				</div>
				<div class="col-md-1">
					<g:message code="ticket.comensales.label" default="Comensales"/>
				</div>
				<div class="col-md-2">
					<g:field name="comensales" type="text" value="${pedidoInstance.comensales}" disabled="true"/>
				</div>
				<div class="col-md-1">
					<g:message code="ticket.mozo.label" default="Mozo"/>
				</div>
				<div class="col-md-5">
					<g:field name="mozonombre" type="text" value="${pedidoInstance.mozo.nombre}" disabled="true"/>
				</div>
			</div>
			<table class="table table-striped table-bordered table-responsive">
				<thead>
					<th>Detalle</th>
					<th>Importe</th>
				</thead>
				<tbody>
					<g:each in="${pedidoInstance.precios()}" status="i" var="precioInstance">
						<g:render template="/precio/show-instance" model="[precioInstance: precioInstance]"/>
					</g:each>
				</tbody>
			</table>
			<br/>
			<div class="row">
				<div class="col-md-1">
					Total
				</div>
				<div class="col-md-1">
					${pedidoInstance.totalFormateado()}
				</div>
			</div>
	</section>
</body>

</html>
