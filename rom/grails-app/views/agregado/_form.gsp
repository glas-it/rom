<%@ page import="rom.Agregado" %>

<br/>
<div class="row">
		<div class="col-md-2">
			<label for="nombre" class="control-label"><g:message code="agregado.nombre.label" default="Nombre" /><span class="required-indicator">*</span></label>
		</div>
		<div class="col-md-4 ${hasErrors(bean: agregadoInstance, field: 'nombre', 'error')} required">
				<g:textField class="form-control nombre" name="nombre" maxlength="100" required="" value="${agregadoInstance?.nombre}"/>
				<span class="help-inline">${hasErrors(bean: agregadoInstance, field: 'nombre', 'error')}</span>
		</div>
		<div class="col-md-2">
			<label for="detalle" class="control-label"><g:message code="agregado.precio.label" default="Detalle" /></label>
		</div>
		<div class="col-md-4 ${hasErrors(bean: agregadoInstance, field: 'detalle', 'error')}">
			<g:field class="form-control" name="agregadoInstance.detalle" type="text" value="${fieldValue(bean: agregadoInstance, field: 'detalle')}"/>
			<span class="help-inline">${hasErrors(bean: agregadoInstance, field: 'detalle', 'error')}</span>
		</div>
</div>
<br/>
<div class="row">
	<div class="col-md-2">
		<label for="subrubro" class="control-label"><g:message code="agregado.subrubro.label" default="Subrubro" /><span class="required-indicator">*</span></label>
	</div>
	<div class="col-md-4 ${hasErrors(bean: agregadoInstance, field: 'subrubro', 'error')} required">
		<g:select class="form-control" id="subrubro" name="subrubro.id" from="${rom.Subrubro.list()}" optionKey="id" required="" value="${agregadoInstance?.subrubro?.id}" class="many-to-one"/>
		<span class="help-inline">${hasErrors(bean: agregadoInstance, field: 'subrubro', 'error')}</span>
	</div>
	
	<div class="col-md-2">
		<label for="activo" class="control-label"><g:message code="agregado.activo.label" default="Activo" /></label>
	</div>
	<div class="col-md-4 ${hasErrors(bean: agregadoInstance, field: 'activo', 'error')} ">
		<div>
			<g:checkBox name="activo" value="${agregadoInstance?.activo}" checked="${agregadoInstance?.activo}" />
			<span class="help-inline">${hasErrors(bean: agregadoInstance, field: 'activo', 'error')}</span>
		</div>
	</div>
</div>
<br/>
<g:render template="/precio/table" model="[consumibleInstance: agregadoInstance]"/>