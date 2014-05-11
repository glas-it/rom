<%@ page import="rom.Precio" %>

<g:set var="nameParam" value="precios[${i}]"></g:set>
<tr id="rowDinamicTable_${i}">
	<g:if test="${precioInstance.id}">
		<g:hiddenField name="${nameParam}.id" value="${precioInstance?.id}" />
		<g:hiddenField name="${nameParam}.version" value="${precioInstance?.version}" />
	</g:if>
	<td>
		<div class="fieldcontain ${hasErrors(bean: precioInstance, field:'descripcion', 'errors')}">
			<g:field class="form-control"  id="precio_${i}" name="${nameParam}.descripcion" value="${precioInstance?.descripcion}" type="text" />
		</div>
	</td>
	<td>
		<div class="fieldcontain ${hasErrors(bean: precioInstance, field:'valor', 'errors')}">
			<g:field class="form-control"  id="precio_${i}" name="${nameParam}.valor" value="${formatNumber(number:precioInstance?.valor,format:'0.00')}" type="numeric" />
		</div>
	</td>
	<td>
		<a class="btn btn-danger" title="Eliminar Entrada" onclick="cymait_dinamicTable_removeRow(${i},'#bodyTablePrecios')">
		<i class="glyphicon glyphicon-trash "></i> 
	</a>
	</td>
</tr>

<script type="text/javascript"> 
	$(document).ready(function(){
		
	});
</script>