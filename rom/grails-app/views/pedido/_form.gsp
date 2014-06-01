
			<div class="row">
				<div class="col-md-1">
					<g:message code="ticket.mesa.label" default="Mesa"/>:
				</div>
				<div class="col-md-2">
					${pedidoInstance?.mesa.numero}
				</div>
				<div class="col-md-1">
					<g:message code="ticket.comensales.label" default="Comensales"/>:
				</div>
				<div class="col-md-2">
					${pedidoInstance?.comensales}
				</div>
				<div class="col-md-1">
					<g:message code="ticket.mozo.label" default="Mozo"/>:
				</div>
				<div class="col-md-2">
					${pedidoInstance?.mozo.nombre}
				</div>
			</div>
			<br/>
			<table class="table table-striped table-bordered table-responsive">
				<thead>
		            <tr>
		                <th>Detalle</th>
		                <th>Cant.</th>
		                <th>Precio Unit.</th>
		                <th>Importe</th>
		            </tr>
				</thead>
				<tbody>
					<g:each var="item" in="${ordenesList}" status="i">
						<tr>
		                    <td class="left">
		                        ${item.descripcion()}
		                    </td>
		                    <td class="right">
		                        ${item.cantidad}
		                    </td>
		                    <td class="right">
		                        ${item.precioUnitarioFormateado()}
		                    </td>
		                    <td class="right">
		                        ${item.importeFormateado()}
		                    </td>
						</tr>
					</g:each>
				</tbody>
			</table>
			<div class="row">
			<div class="col-md-5 pull-right">
			<div class="table-responsive">
				<table class="table table-bordered">
					<tbody>
						<tr class="prop">
							<td valign="top" class="name"><g:message code="pedido.subtotal.label" default="Subtotal" /></td>
							<td valign="top" class="value">${pedidoInstance.subtotalFormateado()}</td>
						</tr>
						<tr class="prop">
							<td valign="top" class="name"><g:message code="pedido.descuento.label" default="Descuento" /></td>
							<td valign="top" class="value">${pedidoInstance.descuentoFormateado()}</td>
						</tr>
						<tr class="prop">
							<td valign="top" class="name"><g:message code="pedido.total.label" default="Total" /></td>
							<td valign="top" class="value">${pedidoInstance.totalFormateado()}</td>
						</tr>
					</tbody>
				</table>
			</div>
			</div>
			</div>
<%--			<div class="row">--%>
<%--				<div class="col-md-1">--%>
<%--					Subtotal--%>
<%--				</div>--%>
<%--				<div class="col-md-2">--%>
<%--					${pedidoInstance.subtotalFormateado()}--%>
<%--				</div>--%>
<%--			</div>--%>
<%--			<div class="row">--%>
<%--				<div class="col-md-1">--%>
<%--					Descuento--%>
<%--				</div>--%>
<%--				<div class="col-md-2">--%>
<%--					${pedidoInstance.descuentoFormateado()}--%>
<%--				</div>--%>
<%--			</div>--%>
<%--			<div class="row">--%>
<%--				<div class="col-md-1">--%>
<%--					Total--%>
<%--				</div>--%>
<%--				<div class="col-md-2">--%>
<%--					${pedidoInstance.totalFormateado()}--%>
<%--				</div>--%>
<%--			</div>--%>