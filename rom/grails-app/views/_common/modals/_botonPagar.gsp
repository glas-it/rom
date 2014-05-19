<!-- Button to trigger modal if Javascript is available -->
<a href="#PagarModal" role="button" class="" data-toggle="modal" title="${message(code: 'pagar.label', default: 'Pagar')}">
	<i class="glyphicon glyphicon-usd"></i>
	<g:message code="anular.label" default="Anular"/>
</a>
<g:render template="/_common/modals/pagarDialog" model="[item: item]"/>