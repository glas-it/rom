<%@ page import="rom.seguridad.Usuario" %>



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

<%-- 
			<div class="${hasErrors(bean: usuarioInstance, field: 'restaurant', 'error')} ">
				<label for="restaurant" class="control-label"><g:message code="usuario.restaurant.label" default="Restaurant" /></label>
				<div>
					<g:select class="form-control" id="restaurant" name="restaurant.id" from="${rom.Restaurant.list()}" optionKey="id" value="${usuarioInstance?.restaurant?.id}" class="many-to-one" noSelection="['null': '']"/>
					<span class="help-inline">${hasErrors(bean: usuarioInstance, field: 'restaurant', 'error')}</span>
				</div>
			</div>
--%>
			<div class="${hasErrors(bean: usuarioInstance, field: 'accountExpired', 'error')} ">
				<label for="accountExpired" class="control-label"><g:message code="usuario.accountExpired.label" default="Account Expired" /></label>
				<div>
					<bs:checkBox name="accountExpired" value="${usuarioInstance?.accountExpired}" />
					<span class="help-inline">${hasErrors(bean: usuarioInstance, field: 'accountExpired', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: usuarioInstance, field: 'accountLocked', 'error')} ">
				<label for="accountLocked" class="control-label"><g:message code="usuario.accountLocked.label" default="Account Locked" /></label>
				<div>
					<bs:checkBox name="accountLocked" value="${usuarioInstance?.accountLocked}" />
					<span class="help-inline">${hasErrors(bean: usuarioInstance, field: 'accountLocked', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: usuarioInstance, field: 'enabled', 'error')} ">
				<label for="enabled" class="control-label"><g:message code="usuario.enabled.label" default="Enabled" /></label>
				<div>
					<bs:checkBox name="enabled" value="${usuarioInstance?.enabled}" />
					<span class="help-inline">${hasErrors(bean: usuarioInstance, field: 'enabled', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: usuarioInstance, field: 'passwordExpired', 'error')} ">
				<label for="passwordExpired" class="control-label"><g:message code="usuario.passwordExpired.label" default="Password Expired" /></label>
				<div>
					<bs:checkBox name="passwordExpired" value="${usuarioInstance?.passwordExpired}" />
					<span class="help-inline">${hasErrors(bean: usuarioInstance, field: 'passwordExpired', 'error')}</span>
				</div>
			</div>

