
<%@ page import="rom.Duenio" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'duenio.label', default: 'Dueño')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>

<body>

<section id="show-duenio" class="first">

	<table class="table">
		<tbody>
		<tr class="prop">
				<td valign="top" class="name"><g:message code="duenio.username.label" default="Name" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: duenioInstance, field: "username")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="duenio.email.label" default="Email" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: duenioInstance, field: "email")}</td>
				
			</tr>
		</tbody>
	</table>
</section>

</body>

</html>
