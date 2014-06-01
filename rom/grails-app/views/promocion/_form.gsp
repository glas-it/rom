<%@ page import="rom.Promocion" %>

<div class="row">
			<div class="${hasErrors(bean: promocionInstance, field: 'nombre', 'has-error')} required">
				<div class="col-md-2">
					<label for="nombre" class="control-label">
						<g:message code="promocion.nombre.label" default="Nombre" />
						<span class="required-indicator">*</span>
					</label>
				</div>
				<div class="col-md-4">
					<g:field type="text" class="form-control" name="nombre" value="${promocionInstance?.nombre}"  />
				</div>
			</div>
			<div class="${hasErrors(bean: promocionInstance, field: 'descripcion', 'has-error')} required">
				<div class="col-md-2">
					<label for="descripcion" class="control-label">
						<g:message code="promocion.descripcion.label" default="Descripción" />
						<span class="required-indicator">*</span>
					</label>
				</div>
				<div class="col-md-4">
					<g:field type="text" class="form-control" name="descripcion" value="${promocionInstance?.descripcion}"  />
				</div>
			</div>
		</div>
		<br/>
		<div class="row">
			<div class="${hasErrors(bean: promocionInstance, field: 'fechaInicio', 'has-error')} required">
				<div class="col-md-2">
					<label for="fechaInicio" class="control-label">
						<g:message code="promocion.fechaInicio.label" default="Fecha Inicio" />
						<span class="required-indicator">*</span>
					</label>
				</div>
			<div class="${hasErrors(bean: promocionInstance, field: 'fechaFin', 'has-error')} required">
				<div class="col-md-4">
						<g:datePicker class="form-control" name="fechaInicio" precision="day"  value="${promocionInstance?.fechaInicio}"  />
					</div>
				</div>
			
				<div class="col-md-2">
					<label for="fechaFin" class="control-label">
						<g:message code="promocion.fechaFin.label" default="Fecha Fin" />
						<span class="required-indicator">*</span>
					</label>
				</div>
				<div class="col-md-4">
					<g:datePicker class="form-control" name="fechaFin" precision="day"  value="${promocionInstance?.fechaFin}"  />
				</div>
			</div>
		</div>
		<br/>
		<div class="row">
			<div class="${hasErrors(bean: promocionInstance, field: 'porcentajeDescuento', 'has-error')} required">
				<div class="col-md-2">
					<label for="porcentajeDescuento" class="control-label">
						<g:message code="promocion.porcentajeDescuento.label" default="Descuento(%)" />
						<span class="required-indicator">*</span>
					</label>
				</div>
				<div class="col-md-4">
					<g:field type="number" class="form-control" name="porcentajeDescuento" value="${fieldValue(bean: promocionInstance, field: 'porcentajeDescuento')}" required=""/>
				</div>
			</div>	
		</div>
		<br/>