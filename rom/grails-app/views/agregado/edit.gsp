<%@ page import="rom.Agregado" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'agregado.label', default: 'Agregado')}" />
	<title><g:message code="default.edit.label" args="[entityName]" /></title>
</head>

<body>

	<section id="edit-agregado" class="first">
		<div class="panel panel-default tab-content">
			<div class="panel-body">
				<g:hasErrors bean="${agregadoInstance}">
				<div class="alert alert-danger">
					<g:renderErrors bean="${agregadoInstance}" as="list" />
				</div>
				</g:hasErrors>
		
				<g:form method="post" class="form-horizontal" role="form" >
					<g:hiddenField name="id" value="${agregadoInstance?.id}" />
					<g:hiddenField name="version" value="${agregadoInstance?.version}" />
					<g:hiddenField name="_method" value="PUT" />
					
					<g:render template="form"/>
					
					<div class="form-actions margin-top-medium">
						<g:actionSubmit class="btn btn-primary" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" />
			            <button class="btn" type="reset"><g:message code="default.button.reset.label" default="Reset" /></button>
					</div>
				</g:form>
			</div>
		</div>
	</section>

</body>

</html>
