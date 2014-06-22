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
			
			<g:form>
			<div class="modal-body">

				<div class="form-group">
					<p><g:message code="default.anular.message" args="[entityName]" default="Ingrese el motivo de la anulación"/></p>
						
					<span class="col-md-6"><g:field class="form-control" type="text" name="motivo" id="txtMotivo${item.id}" /></span>
				</div>
			</div>
			<div class="modal-footer">


				
					<g:hiddenField name="id" value="${item ? item.id : params.id}" />
					<div class="btn-group">
						<button class="btn" data-dismiss="modal" aria-hidden="true"><g:message code="anular.cancel.label" default="Cancelar"/></button>

						<g:actionSubmit class="btn btn-success" action="anular" value="${message(code: 'default.button.anular.label', default: 'Anular')}"/>				
					</div>


			</div>
			
			</g:form>
		</div>
	</div>
</div>
