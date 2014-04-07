<%@ page import="rom.Duenio" %>

	
		<div class="${hasErrors(bean: usuarioInstance, field: 'username', 'error')} required">
			<label for="username" class="control-label"><g:message code="usuario.username.label" default="Username" /><span class="required-indicator">*</span></label>
			<div>
				<g:textField class="form-control" name="username" required="" value="${usuarioInstance?.username}"/>
				<span class="help-inline">${hasErrors(bean: usuarioInstance, field: 'username', 'error')}</span>
			</div>
		</div>

		<div class="${hasErrors(bean: usuarioInstance, field: 'password', 'error')} required">
			<label for="password" class="control-label"><g:message code="usuario.password.label" default="Password" /><span class="required-indicator">*</span></label>
			<div>
				<g:textField class="form-control" name="password" required="" value="${usuarioInstance?.password}"/>
				<span class="help-inline">${hasErrors(bean: usuarioInstance, field: 'password', 'error')}</span>
			</div>
		</div>

		<div class="${hasErrors(bean: usuarioInstance, field: 'email', 'error')} required">
			<label for="email" class="control-label"><g:message code="usuario.email.label" default="Email" /><span class="required-indicator">*</span></label>
			<div>
				<g:field class="form-control" type="email" name="email" required="" value="${usuarioInstance?.email}"/>
				<span class="help-inline">${hasErrors(bean: usuarioInstance, field: 'email', 'error')}</span>
			</div>
		</div>


