<%@ page import="rom.Consumible" %>



			<div class="${hasErrors(bean: consumibleInstance, field: 'nombre', 'error')} required">
				<label for="nombre" class="control-label"><g:message code="consumible.nombre.label" default="Nombre" /><span class="required-indicator">*</span></label>
				<div>
					<g:textField class="form-control" name="nombre" maxlength="100" required="" value="${consumibleInstance?.nombre}"/>
					<span class="help-inline">${hasErrors(bean: consumibleInstance, field: 'nombre', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: consumibleInstance, field: 'descripcion', 'error')} required">
				<label for="descripcion" class="control-label"><g:message code="consumible.descripcion.label" default="Descripcion" /><span class="required-indicator">*</span></label>
				<div>
					<g:textField class="form-control" name="descripcion" maxlength="200" required="" value="${consumibleInstance?.descripcion}"/>
					<span class="help-inline">${hasErrors(bean: consumibleInstance, field: 'descripcion', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: consumibleInstance, field: 'subrubro', 'error')} required">
				<label for="subrubro" class="control-label"><g:message code="consumible.subrubro.label" default="Subrubro" /><span class="required-indicator">*</span></label>
				<div>
					<g:select class="form-control" id="subrubro" name="subrubro.id" from="${rom.Subrubro.list()}" optionKey="id" required="" value="${consumibleInstance?.subrubro?.id}" class="many-to-one"/>
					<span class="help-inline">${hasErrors(bean: consumibleInstance, field: 'subrubro', 'error')}</span>
				</div>
			</div>

