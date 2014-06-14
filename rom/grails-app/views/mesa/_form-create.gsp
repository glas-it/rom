<%@ page import="rom.Mesa" %>

		<div class="row">
			<div class="col-md-2">
				<label for="mesaDesde" class="control-label"><g:message code="mesa.numero.desde.label" default="N° Desde" /><span class="required-indicator">*</span></label>
			</div>
			<div class="col-md-4 ${hasErrors(bean: mesaCreacionCommandInstance, field: 'mesaDesde', 'error')} required">
				<g:field class="form-control" name="mesaDesde" type="number" value="${mesaCreacionCommandInstance.mesaDesde}" required=""/>
				<span class="alert-danger help-inline">${hasErrors(bean: mesaCreacionCommandInstance, field: 'mesaDesde', 'El número de mesa desde debe ser positivo y menor o igual al numero de mesa hasta')}</span>
			</div>
			<div class="col-md-2">
				<label for="mesaHasta" class="control-label"><g:message code="mesa.numero.hasta.label" default="N° Hasta" /><span class="required-indicator">*</span></label>
			</div>
			<div class="col-md-4 ${hasErrors(bean: mesaCreacionCommandInstance, field: 'mesaHasta', 'error')} required">
				<g:field class="form-control" name="mesaHasta" type="number" value="${mesaCreacionCommandInstance.mesaHasta}" required=""/>
				<span class="alert-danger help-inline">${hasErrors(bean: mesaCreacionCommandInstance, field: 'mesaHasta', 'El número de mesa hasta debe ser positivo')}</span>
			</div>
		</div>
		</br>
		<div class="row">
			<div class="col-md-2">
				<label for="capacidad" class="control-label"><g:message code="mesa.capacidad.label" default="Capacidad" /><span class="required-indicator">*</span></label>
			</div>
			<div class="col-md-4 ${hasErrors(bean: mesaCreacionCommandInstance, field: 'capacidad', 'error')} required">
				<g:field class="form-control" name="capacidad" type="number" value="${mesaCreacionCommandInstance.capacidad}" required=""/>
				<span class="alert-danger help-inline">${hasErrors(bean: mesaCreacionCommandInstance, field: 'capacidad', 'La capacidad no puede ser cero')}</span>
			</div>
			<div class="col-md-2">
				<label for="activo" class="control-label"><g:message code="mesa.activo.label" default="Activo" /></label>
			</div>
			<div class="col-md-4 ${hasErrors(bean: mesaCreacionCommandInstance, field: 'activo', 'error')} ">
				<g:checkBox name="activo" value="${mesaCreacionCommandInstance?.activo}" class="form-control"/>
				<span class="alert-danger help-inline">${hasErrors(bean: mesaCreacionCommandInstance, field: 'activo', 'error')}</span>
			</div>
		</div>