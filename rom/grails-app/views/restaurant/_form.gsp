<%@ page import="rom.Restaurant" %>
			<div class="${hasErrors(bean: restaurantInstance, field: 'nombre', 'error')} required">
				<label for="nombre" class="control-label"><g:message code="restaurant.nombre.label" default="Nombre" /><span class="required-indicator">*</span></label>
				<div>
					<g:textField class="form-control" name="nombre" maxlength="70" required="" value="${restaurantInstance?.nombre}"/>
					<span class="help-inline">${hasErrors(bean: restaurantInstance, field: 'nombre', 'error')}</span>
				</div>
				<label for="direccion" class="control-label"><g:message code="restaurant.direccion.label" default="Dirección" /><span class="required-indicator">*</span></label>
				<div>
					<g:textField class="form-control" name="direccion" maxlength="70" required="" value="${restaurantInstance?.direccion}"/>
					<span class="help-inline">${hasErrors(bean: restaurantInstance, field: 'direccion', 'error')}</span>
				</div>
				<label for="telefono" class="control-label"><g:message code="restaurant.telefono.label" default="Teléfono" /><span class="required-indicator">*</span></label>
				<div>
					<g:textField class="form-control" name="telefono" maxlength="70" required="" value="${restaurantInstance?.telefono}"/>
					<span class="help-inline">${hasErrors(bean: restaurantInstance, field: 'telefono', 'error')}</span>
				</div>
				<label for="precioCubierto" class="control-label"><g:message code="restaurant.precioCubierto.label" default="Precio Cubierto" /><span class="required-indicator">*</span></label>
				<div>
					<g:field type="numeric" class="form-control" name="precioCubierto" required="" value="${restaurantInstance?.precioCubierto}"/>
					<span class="help-inline">${hasErrors(bean: restaurantInstance, field: 'precioCubierto', 'error')}</span>
				</div>
			</div>

