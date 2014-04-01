<%@ page import="rom.Consumicion" %>



			<div class="${hasErrors(bean: consumicionInstance, field: 'nombre', 'error')} required">
				<label for="nombre" class="control-label"><g:message code="consumicion.nombre.label" default="Nombre" /><span class="required-indicator">*</span></label>
				<div>
					<g:textField class="form-control" name="nombre" maxlength="100" required="" value="${consumicionInstance?.nombre}"/>
					<span class="help-inline">${hasErrors(bean: consumicionInstance, field: 'nombre', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: consumicionInstance, field: 'descripcion', 'error')} required">
				<label for="descripcion" class="control-label"><g:message code="consumicion.descripcion.label" default="Descripcion" /><span class="required-indicator">*</span></label>
				<div>
					<g:textField class="form-control" name="descripcion" maxlength="200" required="" value="${consumicionInstance?.descripcion}"/>
					<span class="help-inline">${hasErrors(bean: consumicionInstance, field: 'descripcion', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: consumicionInstance, field: 'precios', 'error')} ">
				<label for="precios" class="control-label"><g:message code="consumicion.precios.label" default="Precios" /></label>
				<div>
					
					<span class="help-inline">${hasErrors(bean: consumicionInstance, field: 'precios', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: consumicionInstance, field: 'subrubro', 'error')} required">
				<label for="subrubro" class="control-label"><g:message code="consumicion.subrubro.label" default="Subrubro" /><span class="required-indicator">*</span></label>
				<div>
					<g:select class="form-control" id="subrubro" name="subrubro.id" from="${rom.Subrubro.list()}" optionKey="id" required="" value="${consumicionInstance?.subrubro?.id}" class="many-to-one"/>
					<span class="help-inline">${hasErrors(bean: consumicionInstance, field: 'subrubro', 'error')}</span>
				</div>
			</div>

