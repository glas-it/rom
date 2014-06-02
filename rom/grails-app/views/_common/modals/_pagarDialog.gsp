<!-- 
This is the standard dialog that initiates the delete action.
-->

<!-- Modal dialog -->
<div id="PagarModal${item.id}" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="PagarModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
				<h3 id="PagarModalLabel${item.id}"><g:message code="pagar.label" default="Pagar"/></h3>
			</div>
			<g:form>
			<div class="modal-body">
				<p><g:message code="default.pagar.message" args="[entityName]" default="Ingrese el medio de pago"/></p>
<%--				<g:radioGroup name="medioPago"--%>
<%--              		labels="['Crédito','Débito','Efectivo']"--%>
<%--              		values="[1,2,3]">--%>
<%--					<p>${it.label} ${it.radio}</p>--%>
<%--				</g:radioGroup>--%>
			</div>
			<div class="modal-footer">
					<button class="btn" data-dismiss="modal" aria-hidden="true"><g:message code="pagar.cancel.label" default="Cancelar"/></button>
					<g:hiddenField name="id" value="${item ? item.id : params.id}" />
					<span class="button"><g:actionSubmit class="btn btn-default" action="pago" value="${message(code: 'default.button.pagar.label', default: 'pagar')}"/></span>
			</div>
			</g:form>
		</div>
	</div>
</div>