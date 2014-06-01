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
	<script type="text/javascript">
		$(document).ready(function () {
			$('#Menu').hide();
		});
	</script>
	<section id="show-pedido" class="first">
		<div class="panel panel-default tab-content">
			<div class="panel-body">
				<div id="ticketDiv">
					<g:render template="/pedido/form" model="[pedidoInstance: pedidoInstance]"/>
				</div>
				<br>
				<g:form action="pdf">
					<g:hiddenField name="id" value="${pedidoInstance?.id}" />
					<g:submitButton class="btn btn-default" name="PDF" tagName="PDF"/>
				</g:form>
			</div>
		</div>
	</section>
</body>

</html>
