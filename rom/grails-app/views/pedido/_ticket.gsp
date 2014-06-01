<div id="ticketDiv">
    <h1 class="ticketTitle">${pedidoInstance.mozo.restaurant.nombre}</h1>
    <div class="row">
        <span class="rowItem">
            <span class="col-md-1">
                ${pedidoInstance.mozo.restaurant.direccion}
            </span>
            <span class="col-md-2">
                
            </span>
        </span>
        <span class="pull-right">
            <span class="col-md-5">
                ${pedidoInstance.mozo.restaurant.telefono}
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
            <g:each in="${ordenesList}" status="i" var="item">
                <tr>
                    <td class="left">
                        ${item.descripcion()}
                    </td>
                    <td class="right">
                        ${item.cantidad}
                    </td>
                    <td class="right">
                        ${item.precioUnitarioFormateado()}
                    </td>
                    <td class="right">
                        ${item.importeFormateado()}
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
            <b>${pedidoInstance.subtotalFormateado()}</b>           
        </span>
    </div>
    <div class="rowCoupon">
        <span class="pull-left">
            <b>Descuento aplicado</b>
        </span>
        <span class="pull-right">
            <b>${pedidoInstance.descuentoFormateado()}</b>           
        </span>
    </div>
    <div class="rowTotal">
        <span class="pull-left">
            <b>Total</b>
        </span>
        <span class="pull-right">
            <b>${pedidoInstance.totalFormateado()}</b>           
        </span>
    </div>
    <div class="center" style="padding-top:20px;">
        No válido como ticket fiscal.
    </div>
</div>