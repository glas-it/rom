<div id="ticketDiv">
    <h1 class="ticketTitle">${pedidoInstance.mozo.restaurant.nombre}</h1>
    <div class="row">
        <span class="rowItem">
            <span class="col-md-1">
                Paseo Colón 850
            </span>
            <span class="col-md-2">
                
            </span>
        </span>
        <span class="pull-right">
            <span class="col-md-5">
                4444-5555
            </span>
        </span>
    </div>
    <div class="row">
        <span class="rowItem">
            <span class="col-md-1">
               Buenos Aires, Argentina
            </span>
            <span class="col-md-2">
                
            </span>
        </span>
    </div>
    <div class="row">
        <span class="rowItem">
            <span class="col-md-1">
                Mesa:
            </span>
            <span class="col-md-2">
                ${pedidoInstance.mesa.numero}
            </span>
        </span>
        <span class="rowItem">
            <span class="col-md-1">
                Mozo:
            </span>
            <span class="col-md-5">
                ${pedidoInstance.mozo.nombre}
            </span>
        </span>
    </div>
    <table class="table table-striped table-bordered table-responsive">
        <thead>
            <tr>
                <th class="left" width="50%">Detalle</th>
                <th width="10%">Cant.</th>
                <th width="20%">Precio Unit.</th>
                <th width="20%">Importe</th>
            </tr>
        </thead>
        <tbody>
            <g:each in="${pedidoInstance.precios()}" status="i" var="item">
                <tr>
                    <td class="left">
                        ${item[0]}
                    </td>
                    <td class="right">
                        ${item[1]}
                    </td>
                    <td class="right">
                        ${item[2]}
                    </td>
                    <td class="right">
                        ${item[3]}
                    </td>
                </tr>
            </g:each>
        </tbody>
    </table>
    <div class="rowSubtotal">
        <span class="pull-left">
            <b>Subtotal</b>
        </span>
        <span class="pull-right">
            <b>${pedidoInstance.totalFormateado()}</b>           
        </span>
    </div>
    <div class="center" style="padding-top:20px;">
        No válido como ticket fiscal.
    </div>
</div>