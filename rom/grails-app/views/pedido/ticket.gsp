<%@ page import="rom.Pedido" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'pedido.label', default: 'Pedido')}" />
	<title><g:message code="pedido.ticket.label" default="Ticket" /></title>
	<script src="${resource(dir:'js',file: 'jquery.jqprint-0.3.js')}"></script>
	<script src="${resource(dir:'js',file: 'printThis.js')}"></script>
</head>

<body>
	<section id="show-pedido" class="first">
		<div id="ticketDiv">
			<g:render template="/pedido/form" model="[pedidoInstance: pedidoInstance]"/>
		</div>
		<input id="btnPdf"class="btn btn-default" type="button" value="PDF" />
	</section>
	<script type="text/javascript">
		$('#btnPdf').click( function (){
			$("#ticketDiv").printThis();
		});
	</script>
</body>

</html>
