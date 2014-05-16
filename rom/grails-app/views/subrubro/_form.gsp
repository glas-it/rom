<%@ page import="rom.Subrubro" %>

<div class = "row">
	<div class="col-md-2">
		<label for="nombre" class="control-label"><g:message code="subrubro.nombre.label" default="Nombre" /><span class="required-indicator">*</span></label>	
	</div>
	<div class="col-md-4 ${hasErrors(bean: subrubroInstance, field: 'nombre', 'error')} required">
		<g:textField class="form-control nombre" name="nombre" maxlength="100" required="" value="${subrubroInstance?.nombre}"/>
		<span class="help-inline">${hasErrors(bean: subrubroInstance, field: 'nombre', 'error')}</span>
	</div>
	<div class="col-md-2">
		<label for="orden" class="control-label"><g:message code="subrubro.orden.label" default="Orden" /><span class="required-indicator">*</span></label>
	</div>
	<div class="col-md-4 ${hasErrors(bean: subrubroInstance, field: 'orden', 'error')} required">
		<g:field class="form-control precio" name="orden" type="number" value="${subrubroInstance.orden}" required=""/>
		<span class="help-inline">${hasErrors(bean: subrubroInstance, field: 'orden', 'error')}</span>
	</div>
</div>


<%--
			<div class="${hasErrors(bean: subrubroInstance, field: 'consumiciones', 'error')} ">
				<label for="consumiciones" class="control-label"><g:message code="subrubro.consumiciones.label" default="Consumiciones" /></label>
				<div>
					
<ul class="one-to-many">
<g:each in="${subrubroInstance?.consumiciones?}" var="c">
    <li><g:link controller="consumicion" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="consumicion" action="create" params="['subrubro.id': subrubroInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'consumicion.label', default: 'Consumicion')])}</g:link>
</li>
</ul>

					<span class="help-inline">${hasErrors(bean: subrubroInstance, field: 'consumiciones', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: subrubroInstance, field: 'agregados', 'error')} ">
				<label for="agregados" class="control-label"><g:message code="subrubro.agregados.label" default="Agregados" /></label>
				<div>
					
<ul class="one-to-many">
<g:each in="${subrubroInstance?.agregados?}" var="a">
    <li><g:link controller="agregado" action="show" id="${a.id}">${a?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="agregado" action="create" params="['subrubro.id': subrubroInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'agregado.label', default: 'Agregado')])}</g:link>
</li>
</ul>

					<span class="help-inline">${hasErrors(bean: subrubroInstance, field: 'agregados', 'error')}</span>
				</div>
			</div>
  --%>
</br>
<div class = "row">
	<div class = "col-md-2">
		<label for="rubro" class="control-label"><g:message code="subrubro.rubro.label" default="Rubro" /><span class="required-indicator">*</span></label>	
	</div>
	<div class="col-md-4 ${hasErrors(bean: subrubroInstance, field: 'rubro', 'error')} required">
		<g:select class="form-control" id="rubro" name="rubro.id" from="${rom.Rubro.list()}" optionKey="id" required="" value="${subrubroInstance?.rubro?.id}" class="many-to-one"/>
		<span class="help-inline">${hasErrors(bean: subrubroInstance, field: 'rubro', 'error')}</span>
	</div>
	<div class="col-md-2">
		<label for="aCocina" class="control-label"><g:message code="consumicion.aCocina.label" default="a cocina"/></label>
	</div>
	<div class="col-md-4">
		<g:checkBox name="aCocina" value="${subrubroInstance?.aCocina}" checked="${subrubroInstance?.aCocina}"/>
	</div>
</div>
