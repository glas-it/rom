<!DOCTYPE html>
<%@ page import="rom.Pedido" %>
<html>

<head>
	<g:set var="entityName" value="${message(code: 'pedido.label', default: 'Pedido')}" />
	<title><g:message code="pedido.ticket.label" default="Ticket" /></title>
</head>

<body>
	<section id="show-pedido" class="first">
		<g:render template="form"/>
	</section>
</body>

</html>
