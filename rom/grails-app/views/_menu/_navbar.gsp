<nav id="Navbar" class="navbar navbar-fixed-top navbar-inverse" role="navigation">
	<div class="container">
	
	    <div class="navbar-header">
			<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse">
        		<span class="sr-only">Toggle navigation</span>
        		<span class="icon-bar"></span>
	           	<span class="icon-bar"></span>
	           	<span class="icon-bar"></span>
			</button>
	
			<a class="navbar-brand" href="${createLink(uri: '/')}">
				<img class="logo" src="${resource(plugin: 'kickstart', dir:'images', file:'rom-logo.png')}" alt="${meta(name:'app.name')}" width="16px" height="16px"/> 
				${meta(name:'app.name')}
				<small> v${meta(name:'app.version')}</small>
			</a>
		</div>

		<div class="collapse navbar-collapse navbar-ex1-collapse" role="navigation">

    	<ul class="nav navbar-nav navbar-right">
 			<%--<g:render template="/_menu/search"/> 
			--%>
			
			<%--<sec:ifAnyGranted roles='DUENIO'>
			<li class="controlleractive">
				<g:link controller="restaurant" action="index">
					<g:message code="restaurant.label" default="Mi Restaurant"/>
				</g:link>
			</li>
			
			</sec:ifAnyGranted>
			--%>
			<sec:ifAnyGranted roles='DUENIO'>
				<li class="controlleractive">
					<g:link controller="mesa" action="index">
						<g:message code="mesa.label" default="Mesas"/>
					</g:link>
				</li>
			</sec:ifAnyGranted>
			<sec:ifAnyGranted roles='DUENIO'>
					<li class="controlleractive">
						<g:link controller="mozo" action="index">
							<g:message code="mozo.label" default="Mozos"/>
						</g:link>
					</li>
				</sec:ifAnyGranted>
			<sec:ifAnyGranted roles='DUENIO'>
				<li class="controlleractive">
					<g:link controller="rubro" action="index">
						<g:message code="rubro.label" default="Rubros"/>
					</g:link>
				</li>
			</sec:ifAnyGranted>
			<sec:ifAnyGranted roles='ADMIN'>
				<li class="controlleractive">
					<g:link controller="duenio" action="index">
						<g:message code="duenio.label" default="Dueños"/>
					</g:link>
				</li>
			</sec:ifAnyGranted>
			<sec:ifAnyGranted roles='DUENIO'>
				<li class="controlleractive">
					<g:link controller="subrubro" action="index">
						<g:message code="subrubro.label" default="Subrubros"/>
					</g:link>
				</li>
			</sec:ifAnyGranted>
			
			<sec:ifAnyGranted roles='DUENIO'>
				<li class="controlleractive">
					<g:link controller="consumicion" action="index">
						<g:message code="consumicion.label" default="Consumiciones"/>
					</g:link>
				</li>
			</sec:ifAnyGranted>
			<sec:ifAnyGranted roles='DUENIO'>
				<li class="controlleractive">
					<g:link controller="agregado" action="index">
						<g:message code="agregado.label" default="Agregados"/>
					</g:link>
				</li>
			</sec:ifAnyGranted>
			<sec:ifAnyGranted roles='DUENIO'>
				<li class="controlleractive">
					<g:link controller="orden" action="list">
						<g:message code="orden.label" default="Órdenes"/>
					</g:link>
				</li>
			</sec:ifAnyGranted>
			<sec:ifAnyGranted roles='DUENIO'>
				<li class="controlleractive">
					<g:link controller="pedido" action="list">
						<g:message code="pedido.label" default="Pedidos"/>
					</g:link>
				</li>
			</sec:ifAnyGranted>
			<sec:ifAnyGranted roles='DUENIO'>
				<li class="controlleractive">
					<g:link controller="pedido" action="reporte">
						<g:message code="pedido.label" default="Reportes"/>
					</g:link>
				</li>
			</sec:ifAnyGranted>
			<%--<sec:ifAnyGranted roles='ADMIN'>
				<g:render template="/_menu/admin"/>
			</sec:ifAnyGranted>														
			<g:render template="/_menu/info"/>--%>														
			<g:render template="/_menu/user"/><!-- NOTE: the renderDialog for the "Register" modal dialog MUST be placed outside the NavBar (at least for Bootstrap 2.1.1): see bottom of main.gsp -->
			<%--<g:render template="/_menu/language"/>														
	    --%></ul>			

		</div>
	</div>
</nav>
