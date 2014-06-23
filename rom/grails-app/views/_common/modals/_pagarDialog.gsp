<!-- 
This is the standard dialog that initiates the delete action.
-->

<script type="text/javascript">

	function formatearVuelto(vuelto) {
		return '$' + vuelto.toFixed(2);
	}
		
	$(document).ready(function () {
		$('#total').val(formatearVuelto(${item.total()}))
		$("input[name='medioPago']").change(function (){
			if ($(this).val() == "3") {
				$("#vueltoYMonto").show();
				$("#montoPagado").attr('required', 'required');
			} else {
				$("#vueltoYMonto").hide();
				$("#montoPagado").removeAttr('required');		
				$("#montoPagado").val("");
				$("#vuelto").val("");
			}
		});
		
		$("#montoPagado").change(function() {
                        if ($.isNumeric($(this).val())) {
                                var monto = parseFloat($(this).val());
                                var total = parseFloat($("#totalAPagar").val());
                                var vuelto = monto - total;
                                if (vuelto < 0) {
                                        $('#vuelto').val("El monto debe ser superior al total");
                                } else {
                                        $('#vuelto').val(formatearVuelto(vuelto));
                                }
                        } else {
                                $("#vuelto").val("por favor ingrese un número en el monto");
                        }
                });


		$("#montoPagado").keyup(function() {
			if ($.isNumeric($(this).val())) {
				var monto = parseFloat($(this).val());
				var total = parseFloat($("#totalAPagar").val());
				var vuelto = monto - total;
				if (vuelto < 0) {
					$('#vuelto').val("El monto debe ser superior al total");
				} else {
					$('#vuelto').val(formatearVuelto(vuelto));
				}
			} else {
				$("#vuelto").val("por favor ingrese un número en el monto");
			}
		});
	});
</script>

<!-- Modal dialog -->
<div id="PagarModal${item.id}" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="PagarModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
				<h3 id="PagarModalLabel"><g:message code="pagar.label" default="Pagar"/></h3>
			</div>
			<g:form id="${item.id}">
			<div class="modal-body" class="form-group">
				<h4><g:message code="default.pagar.message" args="[entityName]" default="Medio de pago"/></h4>
<%--				<g:radioGroup name="medioPago"--%>
<%--              		labels="['Crédito','Débito','Efectivo']"--%>
<%--              		values="[1,2,3]">--%>
<%--					<p>${it.label} ${it.radio}</p>--%>
<%--				</g:radioGroup>--%>
				<div class="row">
					
					<span class="col-md-3"><div class="form-group">
						<p>Crédito</p>	
						<g:radio value="1" checked="true" name="medioPago"></g:radio>
					</div></span>
					<span class="col-md-3"><div class="col-md-3 form-group">	
						<p>Débito</p>	
						<g:radio value="2" name="medioPago"></g:radio>
					</div></span>
					<span class="col-md-3"><div class="col-md-3 form-group">
						<p>Efectivo</p>	
						<g:radio id="PagoEfectivo" value="3" name="medioPago"></g:radio>
					</div></span>
				</div>
				<div id="vueltoYMonto" style="display:none">
					Importe:
					<input class="form-control" id="total" disabled="true"/>
					Pago con:
					<input id="montoPagado" min="0" step="0.01" type="number" class="form-control" name="montoPagado"/>
					Vuelto:
					<input class="form-control" id="vuelto" disabled="true"/>
				</div>
				<g:hiddenField name="totalAPagar" id="totalAPagar" value="${item.total()}"/>
			</div>
			<div class="modal-footer">
				<div class="btn-group">
					<button class="btn" data-dismiss="modal" aria-hidden="true">
						<g:message code="pagar.cancel.label" default="Cancelar"/>
					</button>
					<g:actionSubmit class="btn btn-success" action="pago" value="${message(code: 'default.button.pagar.label', default: 'pagar')}"/>
				</div>
			</div>
			</g:form>
		</div>
	</div>
</div>
