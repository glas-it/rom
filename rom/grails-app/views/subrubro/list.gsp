
<%@ page import="rom.Subrubro" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'subrubro.label', default: 'Subrubro')}" />
	<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>

<body>

<section id="list-subrubro" class="first">
	<div class="panel panel-default tab-content">
		<div class="panel-body">
<script type="text/javascript">
	$(document).ready(function() {
		if ($('.prev.disabled') !== undefined)
			$('.prev.disabled').hide()
		if ($('.next.disabled') !== undefined)
			$('.next.disabled').hide()
	})
</script>

	<table class="table table-striped table-bordered margin-top-medium">
		<thead>
			<tr>

				<th>${message(code: 'subrubro.nombre.label', default:'Nombre')}</th>

				<th> <g:message code="subrubro.orden.label"  default="Orden"/> </th>

				<th><g:message code="subrubro.rubro.label" default="Rubro" /></th>

				<th style="width:150px"># Consumiciones</th>

				<th style="width:150px"># Agregados</th>

				<th width="100">${message(code: 'default.acciones.label', default:'Acciones')}</th>
			</tr>
		</thead>
		<tbody>
		<g:each in="${subrubroInstanceList}" status="i" var="subrubroInstance">
			<tr>

				<td><g:link action="show" id="${subrubroInstance.id}">${fieldValue(bean: subrubroInstance, field: "nombre")}</g:link></td>

				<td>${fieldValue(bean: subrubroInstance, field: "orden")}</td>

				<td>${fieldValue(bean: subrubroInstance, field: "rubro")}</td>

				<td>${subrubroInstance.consumiciones.size()}</td>

				<td>${subrubroInstance.agregados.size()}</td>

				<td>
					<div class="row">
						<div class="col-md-2">
							<g:link action="show" id="${subrubroInstance.id}">
								<i class="glyphicon glyphicon-search"></i>
							</g:link>
						</div>
						<div class="col-md-2">
							<g:link action="edit" id="${subrubroInstance.id}">
								<i class="glyphicon glyphicon-pencil"></i>
							</g:link>
						</div>
						<%--<div class="col-md-2">
							<g:link action="delete" id="${subrubroInstance.id}">
								<i class="glyphicon glyphicon-remove"></i>
							</g:link>
						</div>  --%>
					</div>
				</td>

			</tr>
		</g:each>
		</tbody>
	</table>
	</div>
	</div>
	<div>
		<bs:paginate total="${subrubroInstanceCount}" />
	</div>
</section>

</body>

</html>
