#!/bin/bash

# Cantidad de mesas
count=$(echo "SELECT count(*) FROM mesa" | mysql -u rom-dev -p'rom' ROM)

# Me quedo con el numero
totalMesas=$(echo $count | cut -d' ' -f2)

desde=$(($totalMesas + 1))
hasta=$(($desde + 1))

for ((i=$desde; i<$hasta; i++)); do
	nroMesa=$i
	
	nroConsu=14		# Sorrentinos de jamón y queso

	# abro mesa 1
	curl --data "idRestaurant=1&usernameMozo=asd&idMesas=[1]&comensales=3" http://localhost:8080/rom/pedido/apertura > a 2>&1

	cantCons=1
	for ((j=0; j<cantCons; j++)); do
		# alta de orden
		curl --data "idRestaurant=1&idMesa=$nroMesa&platos=[{'idConsumicion':$nroConsu,'observaciones':'alta de consumicion','idAgregado':0,'precio':{'descripcion':'-'},'id':'$nroMesa-$j'}]" http://localhost:8080/rom/orden/alta > a 2>&1

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
done

echo "Pedido agregado OK"
