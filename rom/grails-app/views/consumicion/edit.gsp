<%@ page import="rom.Consumicion" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'consumicion.label', default: 'Consumicion')}" />
	<title><g:message code="default.edit.label" args="[entityName]" /></title>
</head>

<body>

	<section id="edit-consumicion" class="first">
		<div class="panel panel-default tab-content">
			<div class="panel-body">
				<g:hasErrors bean="${consumicionInstance}">
					<div class="alert alert-danger">
						<g:renderErrors bean="${consumicionInstance}" as="list" />
					</div>
				</g:hasErrors>
		
				<g:form method="post" class="form-horizontal" role="form" >
					<g:hiddenField name="id" value="${consumicionInstance?.id}" />
					<g:hiddenField name="version" value="${consumicionInstance?.version}" />
					<g:hiddenField name="_method" value="PUT" />
					
					<g:render template="form" model="[consumibleInstance: consumicionInstance]"/>
					
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
