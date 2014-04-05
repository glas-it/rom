<%@ page import="rom.Rubro" %>



			<div class="${hasErrors(bean: rubroInstance, field: 'nombre', 'error')} required">
				<label for="nombre" class="control-label"><g:message code="rubro.nombre.label" default="Nombre" /><span class="required-indicator">*</span></label>
				<div>
					<g:textField class="form-control" name="nombre" maxlength="100" required="" value="${rubroInstance?.nombre}"/>
					<span class="help-inline">${hasErrors(bean: rubroInstance, field: 'nombre', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: rubroInstance, field: 'orden', 'error')} required">
				<label for="orden" class="control-label"><g:message code="rubro.orden.label" default="Orden" /><span class="required-indicator">*</span></label>
				<div>
					<g:field class="form-control" name="orden" type="number" value="${rubroInstance.orden}" required=""/>
					<span class="help-inline">${hasErrors(bean: rubroInstance, field: 'orden', 'error')}</span>
				</div>
			</div>




<%--
			<div class="${hasErrors(bean: rubroInstance, field: 'subrubros', 'error')} ">
				<label for="subrubros" class="control-label"><g:message code="rubro.subrubros.label" default="Subrubros" /></label>
				<div>

  					
<ul class="one-to-many">
<g:each in="${rubroInstance?.subrubros?}" var="s">
    <li><g:link controller="subrubro" action="show" id="${s.id}">${s?.encodeAsHTML()}</g:link></li>
</g:each>
 
 
<li class="add">
<g:link controller="subrubro" action="create" params="['rubro.id': rubroInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'subrubro.label', default: 'Subrubro')])}</g:link>
</li>
</ul>

					<span class="help-inline">${hasErrors(bean: rubroInstance, field: 'subrubros', 'error')}</span>
				</div>
			</div>
 --%>
