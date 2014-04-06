
<%@ page import="rom.seguridad.Usuario" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'usuario.label', default: 'Usuario')}" />
	<title><g:message code="default.index.label" args="[entityName]" /></title>
</head>

<body>

<section id="index-usuario" class="first">

	<table class="table table-bordered margin-top-medium">
		<thead>
			<tr>
			
				<g:sortableColumn property="username" title="${message(code: 'usuario.username.label', default: 'Username')}" />
			
				<g:sortableColumn property="password" title="${message(code: 'usuario.password.label', default: 'Password')}" />
			
				<g:sortableColumn property="email" title="${message(code: 'usuario.email.label', default: 'Email')}" />
			
				<th><g:message code="usuario.restaurant.label" default="Restaurant" /></th>
			
				<g:sortableColumn property="accountExpired" title="${message(code: 'usuario.accountExpired.label', default: 'Account Expired')}" />
			
				<g:sortableColumn property="accountLocked" title="${message(code: 'usuario.accountLocked.label', default: 'Account Locked')}" />
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${usuarioInstanceList}" status="i" var="usuarioInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link action="show" id="${usuarioInstance.id}">${fieldValue(bean: usuarioInstance, field: "username")}</g:link></td>
			
				<td>${fieldValue(bean: usuarioInstance, field: "password")}</td>
			
				<td>${fieldValue(bean: usuarioInstance, field: "email")}</td>
			
				<td>${fieldValue(bean: usuarioInstance, field: "restaurant")}</td>
			
				<td><g:formatBoolean boolean="${usuarioInstance.accountExpired}" /></td>
			
				<td><g:formatBoolean boolean="${usuarioInstance.accountLocked}" /></td>
			
			</tr>
		</g:each>
		</tbody>
	</table>
	<div>
		<bs:paginate total="${usuarioInstanceCount}" />
	</div>
</section>

</body>

</html>
