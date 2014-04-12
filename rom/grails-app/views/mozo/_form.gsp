<%@ page import="rom.Mozo" %>
</br>
<div class ="row">
	<div class="col-md-2">
		<label for="nombre" class="control-label"><g:message code="usuario.nombre.label" default="Nombre" /><span class="required-indicator">*</span></label>
	</div>
	<div class="col-md-4 ${hasErrors(bean: mozoInstance, field: 'nombre', 'error')} required">
		<div>
				<g:textField class="col-md-3 form-control" name="nombre" required="" value="${mozoInstance?.nombre}"/>
				<span class="help-inline alert-danger">${hasErrors(bean: mozoInstance, field: 'nombre', 'error')}</span>
			</div>
	</div>
	<div class="col-md-2">
		<label for="apellido" class=" control-label"><g:message code="usuario.apellido.label" default="Apellido" /><span class="required-indicator">*</span></label>
	</div>
	<div class="col-md-4 ${hasErrors(bean: mozoInstance, field: 'apellido', 'error')} required">
		<div>
			<g:textField class="col-md-3 form-control" name="apellido" required="" value="${mozoInstance?.apellido}"/>
			<span class="help-inline alert-danger">${hasErrors(bean: mozoInstance, field: 'apellido', 'error')}</span>
		</div>
	</div>
	
</div>
</br>
<div class="row">
	<div class="col-md-2">
		<label for="numeroLegajo" class="control-label"><g:message code="usuario.numeroLegajo.label" default="Numero legajo" /><span class="required-indicator">*</span></label>	
	</div>
	<div class="col-md-4 ${hasErrors(bean: mozoInstance, field: 'numeroLegajo', 'error')} required">
		<div>
			<g:textField class="form-control" name="numeroLegajo" required="" value="${mozoInstance?.numeroLegajo}"/>
			<span class="help-inline alert-danger">${hasErrors(bean: mozoInstance, field: 'numeroLegajo', 'El campo debe ser un número')}</span>
		</div>
	</div>
	<div class="col-md-2">
		<label for="activo" class="control-label"><g:message code="usuario.activo.label" default="Activo" /><span class="required-indicator">*</span></label>
	</div>
	<div class="col-md-4">
		<div>
			<bs:checkBox class="form-control" name="activo" value="${mozoInstance?.activo}" />
			<span class="help-inline alert-danger">${hasErrors(bean: mozoInstance, field: 'activo', '')}</span>
		</div>
	</div>
</div>
</br>
<div class="row">
	<div class="col-md-2">
		<label for="username" class="control-label"><g:message code="usuario.username.label" default="Username" /><span class="required-indicator">*</span></label>
	</div>
	<div class="col-md-4 ${hasErrors(bean: mozoInstance, field: 'username', 'error')} required">
		<div>
			<g:textField class="form-control" name="username" required="" value="${mozoInstance?.username}"/>
			<span class="help-inline alert-danger">${hasErrors(bean: mozoInstance, field: 'username', 'El campo no puede ser vacio')}</span>
		</div>
	</div>
	<div class="col-md-2"></div>
	<div class="col-md-4"></div>
</div>
		


