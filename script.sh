#!/bin/bash
xarxa=$(dialog --title "xarxa" \
		--stdout \
		--inputbox "¿Quina es la subnet?" 0 0)
nom=$(dialog --title "nom" \
		--stdout \
		--inputbox "¿Quin es el nom de la subnet?" 0 0)
ip=$(dialog --title "ip" \
		--stdout \
		--inputbox  "¿Quina es la ip?" 0 0)
imatge=$(dialog --title "imatge" \
		--stdout \
		--inputbox  "¿Quina es la imatge?" 0 0)
volum=$(dialog --title "volum" \
		--stdout \
		--inputbox "¿Nom del volum?" 0 0)
contenidor=$(dialog --title "contenidor" \
		--stdout \
		--inputbox "¿Nom del contenidor?" 0 0)
docker network create --subnet=$xarxa $nom
docker volume create $volum
docker run --net $nom --ip $ip -it $imatge
docker run -d -it --name $contenidor -v $volum:/var/www/html $imatge 
