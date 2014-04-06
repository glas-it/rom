<%@ page import="rom.Agregado" %>



			<div class="${hasErrors(bean: agregadoInstance, field: 'nombre', 'error')} required">
				<label for="nombre" class="control-label"><g:message code="agregado.nombre.label" default="Nombre" /><span class="required-indicator">*</span></label>
				<div>
					<g:textField class="form-control" name="nombre" maxlength="100" required="" value="${agregadoInstance?.nombre}"/>
					<span class="help-inline">${hasErrors(bean: agregadoInstance, field: 'nombre', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: agregadoInstance, field: 'precio', 'error')} required">
				<label for="precio" class="control-label"><g:message code="agregado.precio.label" default="Precio" /><span class="required-indicator">*</span></label>
				<div>
					<g:field class="form-control" name="precio" type="number" value="${fieldValue(bean: agregadoInstance, field: 'precio')}" required=""/>
					<span class="help-inline">${hasErrors(bean: agregadoInstance, field: 'precio', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: agregadoInstance, field: 'descripcion', 'error')} ">
				<label for="descripcion" class="control-label"><g:message code="agregado.descripcion.label" default="Descripcion" /></label>
				<div>
					<g:textField class="form-control" name="descripcion" value="${agregadoInstance?.descripcion}"/>
					<span class="help-inline">${hasErrors(bean: agregadoInstance, field: 'descripcion', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: agregadoInstance, field: 'subrubro', 'error')} required">
				<label for="subrubro" class="control-label"><g:message code="agregado.subrubro.label" default="Subrubro" /><span class="required-indicator">*</span></label>
				<div>
					<g:select class="form-control" id="subrubro" name="subrubro.id" from="${rom.Subrubro.list()}" optionKey="id" required="" value="${agregadoInstance?.subrubro?.id}" class="many-to-one"/>
					<span class="help-inline">${hasErrors(bean: agregadoInstance, field: 'subrubro', 'error')}</span>
				</div>
			</div>

