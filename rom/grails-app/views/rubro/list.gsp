
<%@ page import="rom.Rubro" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'rubro.label', default: 'Rubro')}" />
	<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>

<body>

<section id="list-rubro" class="first">
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

	<table class="table table-bordered table-striped margin-top-medium">
		<thead>
			<tr>

				<th>${message(code: 'rubro.nombre.label', default: 'Nombre')}</th>

				<th>${message(code: 'rubro.orden.label', default: 'Orden')}</th>

				<th># Subrubros</th>

				<th width="100">${message(code: 'default.acciones.label', default:'Acciones')}</th>
			</tr>
		</thead>
		<tbody>
		<g:each in="${rubroInstanceList}" status="i" var="rubroInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">

				<td><g:link action="show" id="${rubroInstance.id}">${fieldValue(bean: rubroInstance, field: "nombre")}</g:link></td>

				<td>
					${fieldValue(bean: rubroInstance, field: "orden")}
					<g:if test="${i != 0}">
						<g:link action="subirOrden" id="${rubroInstance.id}">
							<i class="glyphicon glyphicon-arrow-up right"></i>
						</g:link>
					</g:if>
					<g:if test="${i < rubroInstanceList.size() - 1}">
						<g:link action="bajarOrden" id="${rubroInstance.id}">
							<i class="glyphicon glyphicon-arrow-down right"></i>
						</g:link>
					</g:if>
				</td>
				<td>${rubroInstance.subrubros.size()}</td>
				<td>
					<div class="row">
						<div class="col-md-2">
							<g:link action="show" id="${rubroInstance.id}">
								<i class="glyphicon glyphicon-search"></i>
							</g:link>
						</div>
						<div class="col-md-2">
							<g:link action="edit" id="${rubroInstance.id}">
								<i class="glyphicon glyphicon-pencil"></i>
							</g:link>
						</div>
						<div class="col-md-2">
							<g:link action="delete" id="${rubroInstance.id}">
								<i class="glyphicon glyphicon-remove"></i>
							</g:link>
						</div>
					</div>
				</td>
			</tr>
		</g:each>
		</tbody>
	</table>
	</div>
	</div>
	<div>
		<bs:paginate total="${rubroInstanceCount}" />
	</div>
</section>

</body>

</html>
