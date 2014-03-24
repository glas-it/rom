<%@ page import="rom.Item" %>



<div class="fieldcontain ${hasErrors(bean: itemInstance, field: 'descripcion', 'error')} required">
	<label for="descripcion">
		<g:message code="item.descripcion.label" default="Descripcion" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="descripcion" maxlength="200" required="" value="${itemInstance?.descripcion}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: itemInstance, field: 'subrubro', 'error')} required">
	<label for="subrubro">
		<g:message code="item.subrubro.label" default="Subrubro" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="subrubro" name="subrubro.id" from="${rom.Subrubro.list()}" optionKey="id" required="" value="${itemInstance?.subrubro?.id}" class="many-to-one"/>

</div>

