<%@ page import="rom.Mozo" %>

		<div class="${hasErrors(bean: mozoInstance, field: 'username', 'error')} required">
			
			<label for="username" class="control-label"><g:message code="usuario.username.label" default="Username" /><span class="required-indicator">*</span></label>
			<div>
				<g:textField class="form-control" name="username" required="" value="${mozoInstance?.username}"/>
				<span class="help-inline">${hasErrors(bean: mozoInstance, field: 'username', 'error')}</span>
			</div>
		</div>


