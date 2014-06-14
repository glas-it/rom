
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
	<div class="panel panel-default tab-content">
	<div class="panel-body">
	<g:form action="filter" method="GET" class="form-horizontal" role="form" >

		<div class="row form-group" >
			<div class="col-md-1">
				<label for="rubro" class="control-label">Nombre</label>
			</div>
			<div class="col-md-2">
				<g:textField class="form-control" name="nombre" maxlength="100" value="${consumicionFilter?.nombre}"/>
			</div>
			<div class="col-md-1">
				<label for="rubro" class="control-label">Rubro</label>
			</div>
			<div class="col-md-3">
				<g:select class="form-control" id="rubro" name="rubro.id" value="${consumicionFilter?.rubro}"
				 from="${rom.Rubro.list()}" optionKey="id" class="form-control many-to-one"
				 noSelection="['':'Seleccione un rubro']"/>
			</div>
			<div class="col-md-1" >
				<label for="subrubro" class="control-label">Subrubro</label>
			</div>
			<div class="col-md-3">
				<g:select class="form-control" id="subrubro" name="subrubro.id" value="${consumicionFilter?.subrubro}"
				 from="${rom.Subrubro.list()}" optionKey="id" class="form-control many-to-one"
				 noSelection="['':'Seleccione un subrubro']"/>
			</div>
		</div>
        <div class="row" style="padding-bottom:10px">
            <div class="col-md-2 text-center col-md-offset-2">
			<g:submitButton name="buscar" class="btn btn-primary" value="${message(code: 'default.button.buscar.label', default: 'Buscar')}"/>
            </div>
        </div>
	</g:form>
	<br/>
	<table class="table table-bordered table-striped margin-top-medium">
		<thead>
			<tr>
				<g:sortableColumn property="nombre" title="${message(code: 'consumicion.nombre.label', default: 'Nombre')}" />

				<g:sortableColumn property="detalle" title="${message(code: 'consumicion.detalle.label', default: 'Detalle')}" />

<%--				<g:sortableColumn property="precio" title="${message(code: 'consumicion.precio.label', default: 'Precio')}" />--%>

				<th><g:message code="precio.label" default="precio" /></th>

				<th><g:message code="subrubro.label" default="Sububro" /></th>

				<th><g:message code="subrubro.rubro.label" default="Rubro" /></th>

				<th width="100">${message(code: 'default.acciones.label', default:'Acciones')}</th>

			</tr>
		</thead>
		<tbody>

		<g:each in="${consumicionInstanceList}" status="i" var="consumicionInstance">
			<tr class= "${consumicionInstance.activo == true ? 'even' : 'odd'}">

				<td style="overflow: hidden;"><g:link action="show" id="${consumicionInstance.id}">${fieldValue(bean: consumicionInstance, field: "nombre")}</g:link></td>

				<td>${fieldValue(bean: consumicionInstance, field: "detalle")}</td>

				<td>${consumicionInstance?.precios[0]?.getPrecioFormateado()}</td>

				<td>${fieldValue(bean: consumicionInstance, field: "subrubro")}</td>

				<td>${consumicionInstance.subrubro.rubro}</td>

				<td>
					<div class="row">
						<div class="col-md-2">
							<g:link action="show" id="${consumicionInstance.id}">
								<i class="glyphicon glyphicon-search"></i>
							</g:link>
						</div>
						<div class="col-md-2">
							<g:link action="edit" id="${consumicionInstance.id}">
								<i class="glyphicon glyphicon-pencil"></i>
							</g:link>
						</div>
						<div class="col-md-2">
							<g:link action="delete" id="${consumicionInstance.id}">
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
		<bs:paginate action="${consumicionInstanceAction}" params="${consumicionInstanceParams}" total="${consumicionInstanceCount}"/>
	</div>
</section>

</body>

</html>
