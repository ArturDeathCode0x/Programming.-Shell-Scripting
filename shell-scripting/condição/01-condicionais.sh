#!/bin/bash

echo "Digite R para ver rotas ou I para ver interfaces de rede:"
read entrada

if [ "$entrada" == "r" ] || [ "$entrada" == "R" ]
then

    route -n

elif [ "$entrada" == "i" ] || [ "$entrada" == "I" ]
then

    echo "Digite uma interface de rede:"
    read interface

    echo "Mostrando informações da interface de rede $interface"

    ifconfig "$interface"

else

    echo "Verifique se você digitou corretamente."

fi
