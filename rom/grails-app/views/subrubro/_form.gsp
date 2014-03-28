<%@ page import="rom.Subrubro" %>



<div class="fieldcontain ${hasErrors(bean: subrubroInstance, field: 'descripcion', 'error')} required">
	<label for="descripcion">
		<g:message code="subrubro.descripcion.label" default="Descripcion" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="descripcion" maxlength="200" required="" value="${subrubroInstance?.descripcion}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: subrubroInstance, field: 'items', 'error')} ">
	<label for="items">
		<g:message code="subrubro.items.label" default="Items" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${subrubroInstance?.items?}" var="i">
    <li><g:link controller="item" action="show" id="${i.id}">${i?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="item" action="create" params="['subrubro.id': subrubroInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'item.label', default: 'Item')])}</g:link>
</li>
</ul>


</div>

<div class="fieldcontain ${hasErrors(bean: subrubroInstance, field: 'rubro', 'error')} required">
	<label for="rubro">
		<g:message code="subrubro.rubro.label" default="Rubro" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="rubro" name="rubro.id" from="${rom.Rubro.list()}" optionKey="id" required="" value="${subrubroInstance?.rubro?.id}" class="many-to-one"/>

</div>

