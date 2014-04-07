<%@ page import="rom.Restaurant" %>



			<div class="${hasErrors(bean: restaurantInstance, field: 'nombre', 'error')} required">
				<label for="nombre" class="control-label"><g:message code="restaurant.nombre.label" default="Nombre" /><span class="required-indicator">*</span></label>
				<div>
					<g:textField class="form-control" name="nombre" maxlength="70" required="" value="${restaurantInstance?.nombre}"/>
					<span class="help-inline">${hasErrors(bean: restaurantInstance, field: 'nombre', 'error')}</span>
				</div>
			</div>

