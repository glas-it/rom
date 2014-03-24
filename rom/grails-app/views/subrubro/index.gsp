
<%@ page import="rom.Subrubro" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'subrubro.label', default: 'Subrubro')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-subrubro" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-subrubro" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="descripcion" title="${message(code: 'subrubro.descripcion.label', default: 'Descripcion')}" />
					
						<th><g:message code="subrubro.rubro.label" default="Rubro" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${subrubroInstanceList}" status="i" var="subrubroInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${subrubroInstance.id}">${fieldValue(bean: subrubroInstance, field: "descripcion")}</g:link></td>
					
						<td>${fieldValue(bean: subrubroInstance, field: "rubro")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${subrubroInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
