#!/bin/bash

echo 'Digite o nome do pacote a ser instalado:'
read pacote 
echo 'instalando pacote $pacote'
apt install $pacote -y
apt list -a $pacote
