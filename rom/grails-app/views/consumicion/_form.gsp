<%@ page import="rom.Consumicion" %>



			<div class="${hasErrors(bean: consumicionInstance, field: 'nombre', 'error')} required">
				<label for="nombre" class="control-label"><g:message code="consumicion.nombre.label" default="Nombre" /><span class="required-indicator">*</span></label>
				<div>
					<g:textField class="form-control" name="nombre" maxlength="100" required="" value="${consumicionInstance?.nombre}"/>
					<span class="help-inline">${hasErrors(bean: consumicionInstance, field: 'nombre', 'error')}</span>
				</div>
			</div>
			
			
			<div class="${hasErrors(bean: consumicionInstance, field: 'descripcion', 'error')} ">
				<label for="descripcion" class="control-label"><g:message code="consumicion.descripcion.label" default="Descripción" /><span class="required-indicator">*</span></label>
				<div>
					<g:textField class="form-control" name="descripcion" value="${consumicionInstance?.descripcion}"/>
					<span class="help-inline">${hasErrors(bean: consumicionInstance, field: 'descripcion', 'error')}</span>
				</div>
			</div>
			

			<div class="${hasErrors(bean: consumicionInstance, field: 'precio', 'error')} required">
				<label for="precio" class="control-label"><g:message code="consumicion.precio.label" default="Precio" /><span class="required-indicator">*</span></label>
				<div>
					<g:field class="form-control" name="precio" type="number" value="${fieldValue(bean: consumicionInstance, field: 'precio')}" required=""/>
					<span class="help-inline">${hasErrors(bean: consumicionInstance, field: 'precio', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: consumicionInstance, field: 'descripDos', 'error')} ">
				<label for="descripDos" class="control-label"><g:message code="consumicion.descripDos.label" default="Descripción Dos" /></label>
				<div>
					<g:textField class="form-control" name="descripDos" maxlength="150" value="${consumicionInstance?.descripDos}"/>
					<span class="help-inline">${hasErrors(bean: consumicionInstance, field: 'descripDos', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: consumicionInstance, field: 'precioDos', 'error')} required">
				<label for="precioDos" class="control-label"><g:message code="consumicion.precioDos.label" default="Precio Dos" /></label>
				<div>
					<g:field class="form-control" name="precioDos" type="number" value="${fieldValue(bean: consumicionInstance, field: 'precioDos')}" required=""/>
					<span class="help-inline">${hasErrors(bean: consumicionInstance, field: 'precioDos', 'error')}</span>
				</div>
			</div>
			
			<div class="${hasErrors(bean: consumicionInstance, field: 'descripTres', 'error')} ">
				<label for="descripTres" class="control-label"><g:message code="consumicion.descripTres.label" default="Descripción Tres" /></label>
				<div>
					<g:textField class="form-control" name="descripTres" maxlength="150" value="${consumicionInstance?.descripTres}"/>
					<span class="help-inline">${hasErrors(bean: consumicionInstance, field: 'descripTres', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: consumicionInstance, field: 'precioTres', 'error')} required">
				<label for="precioTres" class="control-label"><g:message code="consumicion.precioTres.label" default="Precio Tres" /></label>
				<div>
					<g:field class="form-control" name="precioTres" type="number" value="${fieldValue(bean: consumicionInstance, field: 'precioTres')}" required=""/>
					<span class="help-inline">${hasErrors(bean: consumicionInstance, field: 'precioTres', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: consumicionInstance, field: 'descripCuatro', 'error')} ">
				<label for="descripCuatro" class="control-label"><g:message code="consumicion.descripCuatro.label" default="Descripción Cuatro" /></label>
				<div>
					<g:textField class="form-control" name="descripCuatro" maxlength="150" value="${consumicionInstance?.descripCuatro}"/>
					<span class="help-inline">${hasErrors(bean: consumicionInstance, field: 'descripCuatro', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: consumicionInstance, field: 'precioCuatro', 'error')}">
				<label for="precioCuatro" class="control-label"><g:message code="consumicion.precioCuatro.label" default="Precio Cuatro" /></label>
				<div>
					<g:field class="form-control" name="precioCuatro" type="number" value="${fieldValue(bean: consumicionInstance, field: 'precioCuatro')}" required=""/>
					<span class="help-inline">${hasErrors(bean: consumicionInstance, field: 'precioCuatro', 'error')}</span>
				</div>
			</div>

<%--
			<div class="${hasErrors(bean: consumicionInstance, field: 'precios', 'error')} ">
				<label for="precios" class="control-label"><g:message code="consumicion.precios.label" default="Precios" /></label>
				<div>
					
					<span class="help-inline">${hasErrors(bean: consumicionInstance, field: 'precios', 'error')}</span>
				</div>
			</div>
  --%>
  
			<div class="${hasErrors(bean: consumicionInstance, field: 'subrubro', 'error')} required">
				<label for="subrubro" class="control-label"><g:message code="consumicion.subrubro.label" default="Subrubro" /><span class="required-indicator">*</span></label>
				<div>
					<g:select class="form-control" id="subrubro" name="subrubro.id" from="${rom.Subrubro.list()}" optionKey="id" required="" value="${consumicionInstance?.subrubro?.id}" class="many-to-one"/>
					<span class="help-inline">${hasErrors(bean: consumicionInstance, field: 'subrubro', 'error')}</span>
				</div>
			</div>

