<%@ page import="rom.Item" %>



<div class="fieldcontain ${hasErrors(bean: itemInstance, field: 'descripcion', 'error')} required">
	<label for="descripcion">
		<g:message code="item.descripcion.label" default="Descripcion" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="descripcion" maxlength="200" required="" value="${itemInstance?.descripcion}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: itemInstance, field: 'items', 'error')} ">
	<label for="items">
		<g:message code="item.items.label" default="Items" />
		
	</label>
	<g:select name="items" from="${rom.Item.list()}" multiple="multiple" optionKey="id" size="5" value="${itemInstance?.items*.id}" class="many-to-many"/>

</div>

