<%@ page import="rom.Mozo" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'mozo.label', default: 'Mozo')}" />
	<title><g:message code="default.create.label" args="[entityName]" /></title>
</head>

<body>

	<section id="create-mozo" class="first">
		<div class="panel panel-default tab-content">
			<div class="panel-body">
				<g:form action="save" class="form-horizontal" role="form" >
					<g:render template="form"/>
		            <div class="row" style="padding-bottom:10px">
		                <div class="col-md-2 text-center col-md-offset-2">
		                    <g:submitButton name="create" class="btn btn-primary" value="${message(code: 'default.button.create.label', default: 'Create')}" />
		                </div>
		                <div class="col-md-2 text-center col-md-offset-4">
		                    <button class="btn" type="reset"><g:message code="default.button.reset.label" default="Reset" /></button>
		                </div>
		            </div>
				</g:form>
			</div>
		</div>
	</section>

</body>

</html>
