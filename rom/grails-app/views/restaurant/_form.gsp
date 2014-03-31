<%@ page import="rom.Restaurant" %>



			<div class="${hasErrors(bean: restaurantInstance, field: 'nombre', 'error')} required">
				<label for="nombre" class="control-label"><g:message code="restaurant.nombre.label" default="Nombre" /><span class="required-indicator">*</span></label>
				<div>
					<g:textField class="form-control" name="nombre" maxlength="70" required="" value="${restaurantInstance?.nombre}"/>
					<span class="help-inline">${hasErrors(bean: restaurantInstance, field: 'nombre', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: restaurantInstance, field: 'usuario', 'error')} required">
				<label for="usuario" class="control-label"><g:message code="restaurant.usuario.label" default="Usuario" /><span class="required-indicator">*</span></label>
				<div>
					<g:select class="form-control" id="usuario" name="usuario.id" from="${rom.seguridad.Usuario.list()}" optionKey="id" required="" value="${restaurantInstance?.usuario?.id}" class="many-to-one"/>
					<span class="help-inline">${hasErrors(bean: restaurantInstance, field: 'usuario', 'error')}</span>
				</div>
			</div>

