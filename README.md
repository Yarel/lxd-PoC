# Exploit/Bypass con LXD - PoC

## Introduction

####Este Bypass es funcional en > = server Ubuntu 20.04

LXD es un «hipervisor» de contenedores y máquinas virtuales, 
El escalado de privilegios funciona gracias a que LXD es instaldo por defecto 
y el usuario creado de forma privilegiada X, Y, Z (!root).Es agregado al grupo LXD por defecto

## Run
	Paso 1: descargue build-alpine => wget https://raw.githubusercontent.com/saghul/lxd-alpine-builder/master/build-alpine [Máquina atacante]
	Paso 2: Build alpine => bash build-alpine (como usuario root) o utilizar la imagen del repositorio alpine.tar.gz [Máquina atacante]
	Paso 3: Copiar a el Script y alpine.tar.gz [Victim Machine]
	Paso 4: Ejecuta este script y obtendrás root [Victim Machine]
	Paso 4: Una vez dentro del contenedor, navegue a /mnt/root para ver todos los recursos de la máquina host
