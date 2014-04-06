
<%@ page import="rom.Mozo" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'mozo.label', default: 'Mozo')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>

<body>

<section id="show-mozo" class="first">

	<table class="table">
		<tbody>
			<tr class="prop">
				<td valign="top" class="name"><g:message code="mozo.username.label" default="Username" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: mozoInstance, field: "username")}</td>
				
			</tr>
		</tbody>
	</table>
</section>

</body>

</html>
