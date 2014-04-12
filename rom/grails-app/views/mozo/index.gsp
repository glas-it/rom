
<%@ page import="rom.Mozo" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'mozo.label', default: 'Mozo')}" />
	<title><g:message code="default.index.label" args="[entityName]" /></title>
</head>

<body>

<section id="index-mozo" class="first">

	<script type="text/javascript">
		$(document).ready(function() {
			if ($('.prev.disabled') !== undefined)
				$('.prev.disabled').hide()
			if ($('.next.disabled') !== undefined)
				$('.next.disabled').hide()
		})
	</script>

	<table class="table table-bordered margin-top-medium">
		<thead>
			<tr>
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${mozoInstanceList}" status="i" var="mozoInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
			</tr>
		</g:each>
		</tbody>
	</table>
	<div>
		<bs:paginate total="${mozoInstanceCount}" />
	</div>
</section>

</body>

</html>
