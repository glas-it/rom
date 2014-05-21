<%@ page import="rom.Promocion" %>


		<div class="row">
			<div class="col-md-2">
				<label for="fechaInicio" class="control-label">
					<g:message code="promocion.fechaInicio.label" default="Fecha Inicio" />
					<span class="required-indicator">*</span>
				</label>
			</div>
			<div class="col-md-4">
				<div class="${hasErrors(bean: promocionInstance, field: 'fechaInicio', 'error')} required">
					<bs:datePicker class="form-control" name="fechaInicio" precision="day"  value="${promocionInstance?.fechaInicio}"  />
					<span class="help-inline">${hasErrors(bean: promocionInstance, field: 'fechaInicio', 'error')}</span>
				</div>
			</div>
			<div class="col-md-2">
				<label for="fechaFin" class="control-label">
					<g:message code="promocion.fechaFin.label" default="Fecha Fin" />
					<span class="required-indicator">*</span>
				</label>
			</div>
			<div class="col-md-4">
				<div class="${hasErrors(bean: promocionInstance, field: 'fechaFin', 'error')} required">
					<bs:datePicker class="form-control" name="fechaFin" precision="day"  value="${promocionInstance?.fechaFin}"  />
					<span class="help-inline">${hasErrors(bean: promocionInstance, field: 'fechaFin', 'error')}</span>
				</div>
			</div>
		</div>
		<br/>
		<div class="row">
			<div class="col-md-2">
				<label for="cantidadCupones" class="control-label">
					<g:message code="promocion.cantidadCupones.label" default="Cantidad Cupones" />
					<span class="required-indicator">*</span>
				</label>
			</div>
			<div class="col-md-4">
				<div class="${hasErrors(bean: promocionInstance, field: 'cantidadCupones', 'error')} required">
					<g:field class="form-control" name="cantidadCupones" type="number" min="1" max="999999" value="${promocionInstance.cantidadCupones}" required=""/>
					<span class="help-inline">${hasErrors(bean: promocionInstance, field: 'cantidadCupones', 'error')}</span>
				</div>
			</div>
			<div class="col-md-2">
				<label for="porcentajeDescuento" class="control-label">
					<g:message code="promocion.porcentajeDescuento.label" default="Descuento(%)" />
					<span class="required-indicator">*</span>
				</label>
			</div>
			<div class="col-md-4">
				<div class="${hasErrors(bean: promocionInstance, field: 'porcentajeDescuento', 'error')} required">
					<g:field class="form-control" name="porcentajeDescuento" value="${fieldValue(bean: promocionInstance, field: 'porcentajeDescuento')}" required=""/>
					<span class="help-inline">${hasErrors(bean: promocionInstance, field: 'porcentajeDescuento', 'error')}</span>
				</div>
			</div>
		</div>	
		<br/>