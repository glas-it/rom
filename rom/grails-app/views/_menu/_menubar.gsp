<div class="">
	<ul class="nav nav-tabs" data-role="listview" data-split-icon="gear" data-filter="true">
		<sec:ifAnyGranted roles='DUENIO'>
			<li class="controlleractive">
				<g:link controller="rubro" action="index">
					<g:message code="restaurant.label" default="Mi Restaurant"/>
				</g:link>
			</li>
		</sec:ifAnyGranted>
		<sec:ifAnyGranted roles='DUENIO'>
			<li class="controlleractive">
				<g:link controller="rubro" action="index">
					<g:message code="rubro.label" default="Rubro"/>
				</g:link>
			</li>
		</sec:ifAnyGranted>
		<sec:ifAnyGranted roles='DUENIO'>
			<li class="controlleractive">
				<g:link controller="subrubro" action="index">
					<g:message code="subrubro.label" default="Subrubro"/>
				</g:link>
			</li>
		</sec:ifAnyGranted>
		<sec:ifAnyGranted roles='DUENIO'>
			<li class="controlleractive">
				<g:link controller="item" action="index">
					<g:message code="item.label" default="Item"/>
				</g:link>
			</li>
		</sec:ifAnyGranted>
	</ul>
</div>
