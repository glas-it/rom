
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
				<div class="col-md-5">
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
		                        ${item.orden.precioFinal()}
		                    </td>
		                    <td class="right">
		                        ${item.importe()}
		                    </td>
						</tr>
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