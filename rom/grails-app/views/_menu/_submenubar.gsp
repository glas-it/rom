<!--
This menu is used to show function that can be triggered on the content (an object or list of objects).
-->

<%-- Only show the "Pills" navigation menu if a controller exists (but not for home) --%>
<g:if test="${	params.controller != null
			&&	params.controller != ''
			&&	params.controller != 'home'
}">
<div class="">
	<ul id="Menu" class="nav nav-tabs">
		<g:set var="entityName" value="${message(code: params.controller+'.label', default: params.controller.substring(0,1).toUpperCase() + params.controller.substring(1).toLowerCase())}" />
		<g:set var="entitiesName" value="${message(code: params.controller+'.label', default: params.controller.substring(0,1).toUpperCase() + params.controller.substring(1).toLowerCase())}" />
		<%--
		<g:ifActionExists target="list">
			--%><li class="${ params.action == "list" ? 'active' : '' }">
				<g:link action="list"><i class="glyphicon glyphicon-th-list"></i> <g:message code="default.list.label" args="[entityName]"/></g:link>
			</li><%--
		</g:ifActionExists>
		--%><%--<g:ifActionExists target="create">
			--%><li class="${ params.action == "create" ? 'active' : '' }">
				<g:link action="create"><i class="glyphicon glyphicon-plus"></i> <g:message code="default.new.label"  args="[entityName]"/></g:link>
			</li><%--
		</g:ifActionExists>
		--%><g:if test="${ params.action == 'show' || params.action == 'edit' }">
			<!-- the item is an object (not a list) -->
			<%--<g:ifActionExists target="edit">
				--%><li id="EditAction" class="${ params.action == "edit" ? 'active' : '' }">
					<g:link action="edit" id="${params.id}"><i class="glyphicon glyphicon-pencil"></i> <g:message code="default.edit.label"  args="[entityName]"/></g:link>
				</li><%--
			</g:ifActionExists>
			--%><%--<g:ifActionExists target="delete">
				<li id="DeleteAction" class="">
					<g:render template="/_common/modals/deleteTextLink"/>
				</li>--%>
			<%--</g:ifActionExists>
		--%></g:if>

	</ul>
	</div>
	</br>
</g:if>
