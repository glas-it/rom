<%@ page import="rom.Subrubro" %>



			<div class="${hasErrors(bean: subrubroInstance, field: 'nombre', 'error')} required">
				<label for="nombre" class="control-label"><g:message code="subrubro.nombre.label" default="Nombre" /><span class="required-indicator">*</span></label>
				<div>
					<g:textField class="form-control" name="nombre" maxlength="200" required="" value="${subrubroInstance?.nombre}"/>
					<span class="help-inline">${hasErrors(bean: subrubroInstance, field: 'nombre', 'error')}</span>
				</div>
			</div>

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

			<div class="${hasErrors(bean: subrubroInstance, field: 'rubro', 'error')} required">
				<label for="rubro" class="control-label"><g:message code="subrubro.rubro.label" default="Rubro" /><span class="required-indicator">*</span></label>
				<div>
					<g:select class="form-control" id="rubro" name="rubro.id" from="${rom.Rubro.list()}" optionKey="id" required="" value="${subrubroInstance?.rubro?.id}" class="many-to-one"/>
					<span class="help-inline">${hasErrors(bean: subrubroInstance, field: 'rubro', 'error')}</span>
				</div>
			</div>

