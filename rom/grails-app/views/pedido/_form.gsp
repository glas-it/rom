
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