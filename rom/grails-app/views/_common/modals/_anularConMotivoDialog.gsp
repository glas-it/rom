<!-- 
This is the standard dialog that initiates the delete action.
-->

<!-- Modal dialog -->
<div id="AnularModal${item.id}" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="AnularModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
				<h3 id="DeleteModalLabel${item.id}"><g:message code="anular.label" default="Anular"/></h3>
			</div>
			<div class="modal-body">
				<p><g:message code="default.anular.message" args="[entityName]" default="Ingrese el motivo de la anulación"/></p>
				<g:field type="text" name="motivo" id="txtMotivo${item.id}" />
			</div>
			<div class="modal-footer">
				<g:form>
					<button class="btn" data-dismiss="modal" aria-hidden="true"><g:message code="anular.cancel.label" default="Cancelar"/></button>
					<g:hiddenField name="id" value="${item ? item.id : params.id}" />
					<span class="button"><g:actionSubmit class="btn btn-default" action="anular" value="${message(code: 'default.button.anular.label', default: 'Anular')}"/></span>
				</g:form>
			</div>
		</div>
	</div>
</div>