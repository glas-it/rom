#!/bin/bash

for ((i=6; i<200; i++)); do 
	
	nroMesa=$i
	
	nroConsu=$(($RANDOM % 14 + 1))

	if [ $nroConsu = 4 ] || [ $nroConsu = 11 ]; then
    	nroConsu=$(($RANDOM % 6 + 5))
	fi

	# abro mesa 1
	curl --data "idRestaurant=1&usernameMozo=asd&idMesas=[1]&comensales=3" http://localhost:8080/rom/pedido/apertura

	# alta de orden
	curl --data "idRestaurant=1&idMesa=$nroMesa&platos=[{'idConsumicion':$nroConsu,'observaciones':'alta de consumicion','idAgregado':0,'precio':{'descripcion':'-'},'id':'$i'}]" http://localhost:8080/rom/orden/alta

	# orden a preparacion
	curl --data "uuidOrden=$i" http://localhost:8080/rom/orden/preparando

	# orden terminada
	curl --data "username=asd&uuidOrden=$i" http://localhost:8080/rom/orden/terminado

	# orden entregada a la mesa
	curl --data "uuidOrden=$i" http://localhost:8080/rom/orden/entregado

	# cierro la mesa 
	curl --data "idRestaurant=1&idMesa=$nroMesa" http://localhost:8080/rom/pedido/cierre
	
	# Pago la mesa
	curl --data "idRestaurant=1&idMesa=$nroMesa&tipoPago=2" http://localhost:8080/rom/pedido/pagoWS

done
