<%@ page import="rom.Mesa" %>


		<div class="row">
			<div class="col-md-2">
				<label for="numero" class="control-label"><g:message code="mesa.numero.label" default="Numero" /><span class="required-indicator">*</span></label>
			</div>
			<div class="col-md-4 ${hasErrors(bean: mesaInstance, field: 'numero', 'error')} required">
				<g:field class="form-control" name="numero" type="number" value="${mesaInstance?.numero}" required=""/>
				<span class="help-inline">${hasErrors(bean: mesaInstance, field: 'numero', 'error')}</span>
			</div>
			<div class="col-md-2">
				<label for="capacidad" class="control-label"><g:message code="mesa.capacidad.label" default="Capacidad" /><span class="required-indicator">*</span></label>
			</div>
			<div class="col-md-4 ${hasErrors(bean: mesaInstance, field: 'capacidad', 'error')} required">
				<g:field class="form-control" name="capacidad" type="number" value="${mesaInstance?.capacidad}" required=""/>
				<span class="help-inline">${hasErrors(bean: mesaInstance, field: 'capacidad', 'error')}</span>
			</div>
		</div>
		</br>
		<div class="row">
			<div class="col-md-2">
				<label for="activo" class="control-label"><g:message code="mesa.activo.label" default="Activo" /></label>
			</div>
			<div class="col-md-4 ${hasErrors(bean: mesaInstance, field: 'activo', 'error')} ">
				<g:checkBox name="activo" value="${mesaInstance?.activo}" />
				<span class="help-inline">${hasErrors(bean: mesaInstance, field: 'activo', 'error')}</span>
			</div>
			<div class="col-md-2">
			</div>
			<div class="col-md-4">
			</div>
		</div>
