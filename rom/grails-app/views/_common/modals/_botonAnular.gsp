<!-- Button to trigger modal if Javascript is available -->
<a href="#AnularModal${item.id}" role="button" class="" data-toggle="modal" title="${message(code: 'anular.label', default: 'Anular')}">
	<i class="glyphicon glyphicon-remove"></i>
</a>
<g:render template="/_common/modals/anularConMotivoDialog" model="[item: item]"/>