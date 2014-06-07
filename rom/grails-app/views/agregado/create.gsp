<%@ page import="rom.Agregado" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'agregado.label', default: 'Agregado')}" />
	<title><g:message code="default.create.label" args="[entityName]" /></title>
</head>

<body>

	<section id="create-agregado" class="first">
		<div class="panel panel-default tab-content">
			<div class="panel-body">
				<g:hasErrors bean="${agregadoInstance}">
				<div class="alert alert-danger">
					<g:renderErrors bean="${agregadoInstance}" as="list" />
				</div>
				</g:hasErrors>

				<g:form action="save" class="form-horizontal" role="form" >
					<div class="tab-content">
						<g:render template="form"/>

						<div class="form-actions margin-top-medium">
							<g:submitButton name="create" class="btn btn-primary" value="${message(code: 'default.button.create.label', default: 'Create')}" />
				            <button class="btn" type="reset"><g:message code="default.button.reset.label" default="Reset" /></button>
						</div>
					</div>
				</g:form>
			</div>
		</div>
	</section>

</body>

</html>
