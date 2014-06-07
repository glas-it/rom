<%@ page import="rom.Consumicion" %>

<div class="row">
	<div class="col-md-2">
		<label for="nombre" class="control-label"><g:message code="consumicion.nombre.label" default="Nombre" /><span class="required-indicator">*</span></label>
	</div>
	<div class="col-md-4 ${hasErrors(bean: consumicionInstance, field: 'nombre', 'error')} required">
		<div>
			<g:textField class="form-control" name="nombre" maxlength="100" required="" value="${consumicionInstance?.nombre}"/>
			<span class="help-inline">${hasErrors(bean: consumicionInstance, field: 'nombre', 'error')}</span>
		</div>
	</div>
	<div class="col-md-2">
		<label for="detalle" class="control-label"><g:message code="consumicion.detalle.label" default="Detalle" /></label>
	</div>
	<div class="col-md-4">
		<g:textField class="form-control" name="detalle" maxlength="100" value="${consumicionInstance?.detalle}"/>
		<span class="help-inline">${hasErrors(bean: consumicionInstance, field: 'detalle', 'error')}</span>
	</div>
</div>
</br>
<div class="row">
	<div class="col-md-2">
		<label for="subrubro" class="control-label"><g:message code="consumicion.subrubro.label" default="Subrubro" /><span class="required-indicator">*</span></label>
	</div>
	<div class="col-md-4 ${hasErrors(bean: consumicionInstance, field: 'subrubro', 'error')} required">
		<g:select id="subrubro" name="subrubro.id" from="${rom.Subrubro.list()}" optionKey="id" required="" value="${consumicionInstance?.subrubro?.id}" class="form-control"/>
		<span class="help-inline">${hasErrors(bean: consumicionInstance, field: 'subrubro', 'error')}</span>
	</div>
	<div class="col-md-1">
		<label for="activo" class="control-label"><g:message code="consumicion.activo.label" default="Activo" /></label>
	</div>
	<div class="col-md-2 ${hasErrors(bean: consumicionInstance, field: 'activo', 'error')} ">
		<g:checkBox name="activo" value="${consumicionInstance?.activo}" checked="${consumicionInstance?.activo}" />
		<span class="help-inline">${hasErrors(bean: consumicionInstance, field: 'activo', 'error')}</span>
	</div>
	<div class="col-md-1">
		<label for="aCocina" class="control-label"><g:message code="consumicion.aCocina.label" default="A cocina"/></label>
	</div>
	<div class="col-md-2">
		<g:checkBox name="aCocina" value="${consumicionInstance?.aCocina}" checked="${consumicionInstance?.aCocina}"/>
	</div>
</div>
</br>
<g:render template="/precio/table"/>


