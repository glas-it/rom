<%@ page import="rom.Rubro" %>

<div class = "row">
	<div class="col-md-2">
		<label for="nombre" class="control-label"><g:message code="rubro.nombre.label" default="Nombre" /><span class="required-indicator">*</span></label>
	</div>
	<div class="col-md-4 ${hasErrors(bean: rubroInstance, field: 'nombre', 'error')} required">
		<g:textField class="form-control nombre" name="nombre" maxlength="100" required="" value="${rubroInstance?.nombre}"/>
		<span class="help-inline">${hasErrors(bean: rubroInstance, field: 'nombre', 'error')}</span>
	</div>
	<div class="col-md-2">
		<label for="orden" class="control-label"><g:message code="rubro.orden.label" default="Orden" /><span class="required-indicator">*</span></label>	
	</div>
	<div class="col-md-4 ${hasErrors(bean: rubroInstance, field: 'orden', 'error')} required">
		<g:field class="form-control precio" name="orden" type="number" value="${rubroInstance.orden}" required=""/>
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
