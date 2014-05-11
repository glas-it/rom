<table class="table table-bordered margin-top-medium">
	<thead>
		<tr>
			<th>${message(code: 'precio.descripcion.label', default: 'Descripción')}</th>
		
			<th>${message(code: 'precio.valor.label', default: 'Valor')}</th>
		</tr>
	</thead>
	<tbody>
		<g:each in="${precioInstanceList}" status="i" var="precioInstance">
			<g:render template="/precio/show-instance" model="[precioInstance: precioInstance]"/>
		</g:each>
	</tbody>
</table>