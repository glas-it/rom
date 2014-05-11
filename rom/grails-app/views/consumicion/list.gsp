
<%@ page import="rom.Consumicion" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'consumicion.label', default: 'Consumicion')}" />
	<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>

<body>

<section id="list-consumicion" class="first">

	<script type="text/javascript">
		$(document).ready(function() {
			if ($('.prev.disabled') !== undefined)
				$('.prev.disabled').hide()
			if ($('.next.disabled') !== undefined)
				$('.next.disabled').hide()
		})
	</script>
	<div class="panel panel-default tab-content">
	<div class="panel-body">
	<g:form action="filter" method="GET" class="form-horizontal" role="form" >
		
		<div class="row form-group" >
			<div class="col-md-1">
				<label for="rubro" class="control-label">Nombre</label>
			</div>
			<div class="col-md-3">
				<g:textField class="form-control" name="nombre" maxlength="100" />
			</div>
			<div class="col-md-1">
				<label for="rubro" class="control-label">Rubro</label>
			</div>
			<div class="col-md-3">
				<g:select class="form-control" id="rubro" name="rubro.id"
				 from="${rom.Rubro.list()}" optionKey="id" class="form-control many-to-one"
				 noSelection="['':'Seleccione un rubro']"/>
			</div>
			<div class="col-md-1" >
				<label for="subrubro" class="control-label">Subrubro</label>
			</div>
			<div class="col-md-3">
				<g:select class="form-control" id="subrubro" name="subrubro.id"
				 from="${rom.Subrubro.list()}" optionKey="id" class="form-control many-to-one"
				 noSelection="['':'Seleccione un subrubro']"/>
			</div>
		</div>
		<div class="form-actions margin-top-medium">
			<g:submitButton name="buscar" class="btn btn-primary" value="${message(code: 'default.button.buscar.label', default: 'Buscar')}"/>
		</div>
			
	</g:form>
	</div>	
	<table class="table table-bordered margin-top-medium">
		<thead>
			<tr>
				<g:sortableColumn property="nombre" title="${message(code: 'consumicion.nombre.label', default: 'Nombre')}" />
			
				<g:sortableColumn property="descripcion" title="${message(code: 'consumicion.descripcion.label', default: 'Descripción')}" />
			
				<g:sortableColumn property="precio" title="${message(code: 'consumicion.precio.label', default: 'Precio')}" />
			
				<th><g:message code="subrubro.label" default="Sububro" /></th>
				
				<th><g:message code="subrubro.rubro.label" default="Rubro" /></th>
				
				<th><g:message code="acciones.label" default="Acciones"/></th>
				
			</tr>
		</thead>
		<tbody>
		<g:each in="${consumicionInstanceList}" status="i" var="consumicionInstance">
			<tr class= "${consumicionInstance.activo == true ? 'even' : 'odd'}">
			
				<td>${fieldValue(bean: consumicionInstance, field: "nombre")}</td>

				<td>${fieldValue(bean: consumicionInstance, field: "detalle")}</td>
			
				<td>${consumicionInstance?.precios[0]?.getPrecioFormateado()}</td>
				
				<td>${fieldValue(bean: consumicionInstance, field: "subrubro")}</td>
				
				<td>${consumicionInstance.subrubro.rubro}</td>
			
				<td><g:link action="show" id="${consumicionInstance.id}"><i class="glyphicon glyphicon-search"/></g:link></td>
			</tr>
		</g:each>
		</tbody>
	</table>
	</div>
	<div>
		<bs:paginate total="${consumicionInstanceCount}"/>
	</div>
</section>

</body>

</html>
