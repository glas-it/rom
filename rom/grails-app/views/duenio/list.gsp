
<%@ page import="rom.Duenio" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'duenio.label', default: 'Dueño')}" />
	<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>

<body>

<section id="list-duenio" class="first">

	<table class="table table-bordered margin-top-medium">
		<thead>
			<tr>
				<g:sortableColumn property="username" title="${message(code: 'duenio.username.label', default: 'Username')}" />
			
				<g:sortableColumn property="email" title="${message(code: 'duenio.email.label', default: 'Email')}" />
			</tr>
		</thead>
		<tbody>
		<g:each in="${duenioInstanceList}" status="i" var="duenioInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
				<td><g:link action="show" id="${duenioInstance.id}">${fieldValue(bean: duenioInstance, field: "username")}</g:link></td>
			
				<td>${fieldValue(bean: duenioInstance, field: "email")}</td>
			</tr>
		</g:each>
		</tbody>
	</table>
	<div>
		<bs:paginate total="${duenioInstanceCount}" />
	</div>
</section>

</body>

</html>
