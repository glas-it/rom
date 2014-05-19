<!-- Button to trigger modal if Javascript is available -->
<a href="#PagarModal${item.id}" role="button" class="" data-toggle="modal" title="${message(code: 'pagar.label', default: 'Pagar')}">
	<i class="glyphicon glyphicon-usd"></i>
	<g:message code="pagar.label" default="Pagar"/>
</a>
<g:render template="/_common/modals/pagarDialog" model="[item: item]"/>