#!/bin/bash
echo "Digite uma interface de rede :"
read interface
echo "Mostrando informacoes da interface de redes $interface"
ifconfig $interface
