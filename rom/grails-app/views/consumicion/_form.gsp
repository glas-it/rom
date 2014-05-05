<%@ page import="rom.Consumicion" %>

<div class="row">
	<div class="col-md-2">
		<label for="nombre" class="control-label"><g:message code="consumicion.nombre.label" default="Nombre" /><span class="required-indicator">*</span></label>
	</div>
	<div class="col-md-4 ${hasErrors(bean: consumicionInstance, field: 'nombre', 'error')} required">
		<div>
			<g:textField class="form-control nombre" name="nombre" maxlength="100" required="" value="${consumicionInstance?.nombre}"/>
			<span class="help-inline">${hasErrors(bean: consumicionInstance, field: 'nombre', 'error')}</span>
		</div>
	</div>
	<div class="col-md-2"></div>
	<div class="col-md-4"></div>
	
</div>
</br>
<div class="row">	
	<div class="col-md-2">
		<label for="descripcion" class="control-label"><g:message code="consumicion.descripcion.label" default="Descripción" /><span class="required-indicator">*</span></label>	
	</div>
	
	<div class="col-md-4 ${hasErrors(bean: consumicionInstance.precios[0], field: 'descripcion', 'error')} ">
		<div>
			<g:textField class="form-control descripcion" name="precios[0].descripcion" value="${consumicionInstance?.precios[0].descripcion}"/>
			<span class="help-inline">${hasErrors(bean: consumicionInstance.precios[0], field: 'descripcion', 'error')}</span>
		</div>
	</div>
	<div class="col-md-2">
		<label for="precio" class="control-label"><g:message code="consumicion.precio.label" default="Precio" /><span class="required-indicator">*</span></label>
	</div>
	<div class="col-md-4${hasErrors(bean: consumicionInstance.precios[0], field: 'valor', 'error')} required">
			<g:field class="form-control precio" name="precios[0].valor" type="number" value="${consumicionInstance?.precios[0].valor}" required=""/>
			<span class="help-inline">${hasErrors(bean: consumicionInstance.precios[0], field: 'valor', 'error')}</span>
	</div>
</div>
</br>
<div class="row">	
	<div class="col-md-2">
		<label for="descripDos" class="control-label"><g:message code="consumicion.descripDos.label" default="Descripción Dos" /></label>
	</div>
	<div class="col-md-4 ${consumicionInstance.precios[1]? hasErrors(bean: consumicionInstance.precios[1], field: 'descripcion', 'error') : ''} ">
		<g:textField class="form-control descripcion" name="precios[1].descripcion" maxlength="150" value="${consumicionInstance?.precios[1].descripcion}"/>
		<span class="help-inline">${hasErrors(bean: consumicionInstance.precios[1], field: 'descripcion', 'error')}</span>
	</div>
	<div class="col-md-2">
		<label for="precioDos" class="control-label"><g:message code="consumicion.precioDos.label" default="Precio Dos" /></label>
	</div>
	<div class="col-md-4 ${hasErrors(bean: consumicionInstance.precios[1], field: 'valor', 'error')} required">
		<g:field class="form-control precio" name="precios[1].valor" type="number" value="${consumicionInstance?.precios[1].valor}" required=""/>
		<span class="help-inline">${hasErrors(bean: consumicionInstance.precios[1], field: 'valor', 'error')}</span>
	</div>
</div>
</br>
<div class="row">
	<div class="col-md-2">
		<label for="descripTres" class="control-label"><g:message code="consumicion.descripTres.label" default="Descripción Tres" /></label>
	</div>
	<div class="col-md-4 ${hasErrors(bean: consumicionInstance.precios[2], field:'descripcion', 'error')} ">
		<g:textField class="form-control descripcion" name="precios[2].descripcion" maxlength="150" value="${consumicionInstance?.precios[2].descripcion}"/>
		<span class="help-inline">${hasErrors(bean: consumicionInstance?.precios[2], field: 'descripcion', 'error')}</span>
	</div>
 	<div class="col-md-2">
		<label for="precioTres" class="control-label"><g:message code="consumicion.precioTres.label" default="Precio Tres" /></label>
	</div>
	<div class="col-md-4 ${hasErrors(bean: consumicionInstance.precios[2], field: 'valor', 'error')} required">
		<g:field class="form-control precio" name="precios[2].valor" type="number" value="${consumicionInstance?.precios[2].valor}" required=""/>
		<span class="help-inline">${hasErrors(bean: consumicionInstance.precios[2], field: 'valor', 'error')}</span>
	</div>
</div>
</br>
<div class="row">
	<div class="col-md-2">
		<label for="descripCuatro" class="control-label"><g:message code="consumicion.descripCuatro.label" default="Descripción Cuatro" /></label>
	</div>
	<div class="col-md-4 ${hasErrors(bean: consumicionInstance?.precios[3], field: 'descripcion', 'error')} ">
		<g:textField class="form-control descripcion" name="precios[3].descripcion" maxlength="150" value="${consumicionInstance?.precios[3].descripcion}"/>
		<span class="help-inline">${hasErrors(bean: consumicionInstance?.precios[3], field: 'descripcion', 'error')}</span>
	</div>
	<div class="col-md-2">
		<label for="precioCuatro" class="control-label"><g:message code="consumicion.precioCuatro.label" default="Precio Cuatro" /></label>
	</div>
	<div class="col-md-4 ${hasErrors(bean: consumicionInstance.precios[3], field: 'valor', 'error')}">
		<g:field class="form-control precio" name="precios[3].valor" type="number" value="${consumicionInstance?.precios[3].valor}" required=""/>
		<span class="help-inline">${hasErrors(bean: consumicionInstance?.precios[3], field:'valor', 'error')}</span>
	</div>
</div>
</br>
<div class="row">	
	<div class="col-md-2">
		<label for="subrubro" class="control-label"><g:message code="consumicion.subrubro.label" default="Subrubro" /><span class="required-indicator">*</span></label>
	</div>
	<div class="col-md-4 ${hasErrors(bean: consumicionInstance, field: 'subrubro', 'error')} required">
		<g:select class="form-control" id="subrubro" name="subrubro.id" from="${rom.Subrubro.list()}" optionKey="id" required="" value="${consumicionInstance?.subrubro?.id}" class="many-to-one"/>
		<span class="help-inline">${hasErrors(bean: consumicionInstance, field: 'subrubro', 'error')}</span>
	</div>
	<div class="col-md-2">
		<label for="activo" class="control-label"><g:message code="consumicion.activo.label" default="Activo" /></label>
	</div>
	<div class="col-md-4 ${hasErrors(bean: consumicionInstance, field: 'activo', 'error')} ">
		<bs:checkBox name="activo" value="${consumicionInstance?.activo}" checked="${consumicionInstance?.activo}" />
		<span class="help-inline">${hasErrors(bean: consumicionInstance, field: 'activo', 'error')}</span>
	</div>
	
<%--
			<div class="${hasErrors(bean: consumicionInstance, field: 'precios', 'error')} ">
				<label for="precios" class="control-label"><g:message code="consumicion.precios.label" default="Precios" /></label>
				<div>
					
					<span class="help-inline">${hasErrors(bean: consumicionInstance, field: 'precios', 'error')}</span>
				</div>
			</div>
  --%>

</div>

