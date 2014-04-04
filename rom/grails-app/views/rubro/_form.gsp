<%@ page import="rom.Rubro" %>



			<div class="${hasErrors(bean: rubroInstance, field: 'nombre', 'error')} required">
				<label for="nombre" class="control-label"><g:message code="rubro.nombre.label" default="Nombre" /><span class="required-indicator">*</span></label>
				<div>
					<g:textField class="form-control" name="nombre" maxlength="200" required="" value="${rubroInstance?.nombre}"/>
					<span class="help-inline">${hasErrors(bean: rubroInstance, field: 'nombre', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: rubroInstance, field: 'orden', 'error')} required">
				<label for="orden" class="control-label"><g:message code="rubro.orden.label" default="Orden" /><span class="required-indicator">*</span></label>
				<div>
					<g:field class="form-control" name="orden" type="number" min="1" value="${rubroInstance.orden}" required=""/>
					<span class="help-inline">${hasErrors(bean: rubroInstance, field: 'orden', 'error')}</span>
				</div>
			</div>

