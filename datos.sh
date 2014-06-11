#!/bin/bash
desde=6
hasta=30
b=0

for ((i=$desde; i<$hasta; i++)); do
	nroMesa=$i

	nroConsu=$(($RANDOM % 14 + 1))

	if [ $nroConsu = 4 ] || [ $nroConsu = 11 ]; then
    	nroConsu=$(($RANDOM % 6 + 5))
	fi

	# abro mesa 1
	curl --data "idRestaurant=1&usernameMozo=asd&idMesas=[1]&comensales=3" http://localhost:8080/rom/pedido/apertura > a 2>&1

	cantCons=$(($RANDOM % 4 + 1))
	for ((j=0; j<cantCons; j++)); do
		# alta de orden
		curl --data "idRestaurant=1&idMesa=$nroMesa&platos=[{'idConsumicion':$nroConsu,'observaciones':'alta de consumicion','idAgregado':0,'precio':{'descripcion':'-'},'id':'$nroMesa-$j'}]" http://localhost:8080/rom/orden/alta  > a 2>&1

		# orden a preparacion
		curl --data "uuidOrden=$nroMesa-$j" http://localhost:8080/rom/orden/preparando > a 2>&1

		# orden terminada
		curl --data "username=asd&uuidOrden=$nroMesa-$j" http://localhost:8080/rom/orden/terminado > a 2>&1

		# orden entregada a la mesa
		curl --data "uuidOrden=$nroMesa-$j" http://localhost:8080/rom/orden/entregado > a 2>&1
	done
	# cierro la mesa
	curl --data "idRestaurant=1&idMesa=$nroMesa" http://localhost:8080/rom/pedido/cierre > a 2>&1

	# Pago la mesa
	curl --data "idRestaurant=1&idMesa=$nroMesa&tipoPago=2" http://localhost:8080/rom/pedido/pagoWS > a 2>&1

	b=$i
done

mysql -u"rom-dev" -p"rom" < ./updates.sql

ok=$(($i - $desde))
total=$(($hasta - $desde))
echo "$ok OK de $total"
