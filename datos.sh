#!/bin/bash

for ((i=1; i<5; i++)); do 
	
	nroMesa=$(($i+5))
	
	# abro mesa 1
	curl --data "idRestaurant=1&usernameMozo=asd&idMesas=[1]&comensales=3" http://localhost:8080/rom/pedido/apertura

	# alta de orden
	curl --data "idRestaurant=1&idMesa=$nroMesa&platos=[{'idConsumicion':14,'observaciones':'alta de coso','idAgregado':15,'precio':{'descripcion':'-'},'id':'$i'}]" http://localhost:8080/rom/orden/alta

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
