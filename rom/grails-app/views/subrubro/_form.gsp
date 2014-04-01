<%@ page import="rom.Subrubro" %>



			<div class="${hasErrors(bean: subrubroInstance, field: 'descripcion', 'error')} required">
				<label for="descripcion" class="control-label"><g:message code="subrubro.descripcion.label" default="Descripcion" /><span class="required-indicator">*</span></label>
				<div>
					<g:textField class="form-control" name="descripcion" maxlength="200" required="" value="${subrubroInstance?.descripcion}"/>
					<span class="help-inline">${hasErrors(bean: subrubroInstance, field: 'descripcion', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: subrubroInstance, field: 'rubro', 'error')} required">
				<label for="rubro" class="control-label"><g:message code="subrubro.rubro.label" default="Rubro" /><span class="required-indicator">*</span></label>
				<div>
					<g:select class="form-control" id="rubro" name="rubro.id" from="${rom.Rubro.list()}" optionKey="id" required="" value="${subrubroInstance?.rubro?.id}" class="many-to-one"/>
					<span class="help-inline">${hasErrors(bean: subrubroInstance, field: 'rubro', 'error')}</span>
				</div>
			</div>

