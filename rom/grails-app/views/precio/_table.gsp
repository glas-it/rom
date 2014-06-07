<div class="row">
	<div class="col-md-2">
		<a id="btnAddPrecio" class="btn btn-mini btn-success"
			title="Agregar Precio">Agregar Precio
		</a>
	</div>
	<div class="col-md-10"></div>
</div>
<br/>
<table class="table table-bordered">
	<thead>
		<tr>
			<th><g:message code="precio.descripcion.label" default="Descripcion" /></th>
			<th><g:message code="precio.valor.label" default="Valor" /></th>
			<th width="100">Acciones</th>
		</tr>
	</thead>
	<tbody id="bodyTablePrecios">
		<g:each in="${ consumibleInstance?.precios}" var="it" status="i">
			<g:render template="/precio/create" model="[precioInstance: it, nameController:nameController, i: i]" />
		</g:each>
	</tbody>
</table>
<!-- Funcion a ejecutar cuando se completa la carga -->
<script type="text/javascript">
	$(document).ready(function(){
		$("#btnAddPrecio").on("click", function(e) {
  			e.preventDefault();
  			cymait_dinamicTable_addRow("consumible/addPrecio","#bodyTablePrecios");
		});
	});
</script>