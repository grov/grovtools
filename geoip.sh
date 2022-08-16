#!/bin/bash

#Créer le répertoire OLD s'il n'existe pas
mkdir -p OLD

echo "*** Copie des anciens fichiers dans le répertoire OLD ***"
if [ -f ip.txt -a -f geo_result.txt -a -f ip_unique.txt -a -f pays.txt ]; then
mv ip.txt OLD/ip.txt.$(date +%F_%R)
mv geo_result.txt OLD/geo_result.txt.$(date +%F_%R)
mv ip_unique.txt OLD/ip_unique.txt.$(date +%F_%R)
mv pays.txt OLD/pays.txt.$(date +%F_%R)
fi

#Récupération des adresses IP du fichier CSV source
echo "Quel est le nom du fichier source ?:"
read source
grep -oE "\b([0-9]{1,3}\.){3}([0-9]{1,3})\b" $source > ip.txt
echo "*** Parsing des adresses IP du fichier CSV ***"

#Calcul du nombre de ligne avant la suppression des doublons
echo "*** Nombre de ligne avant suppression des doublons : ***" && cat ip.txt | wc -l

#Suppression des doublons
echo "*** Suppression des doublons ***"
sort ip.txt | uniq > ip_unique.txt
echo "*** Les ips uniques se trouvent dans le fichier ip_unique.txt ***"

#Calcul du nombre de ligne après la suppression des doublons
echo "*** Nombre de ligne après suppression des doublons : ***" && cat ip_unique.txt | wc -l

# Lancement du script geolocate.py
echo "*** Lancement du script de localisation ***"
/usr/local/bin/python3 geolocate.py ip_unique.txt > geo_result.txt
echo "*** Les résultats se trouvent dans le fichier geo_result.txt ***"


# Statistiques
echo "*** Statistiques sur le fichier geo_result.txt ***"

#Nombre total de ligne
echo -n "Nombre total de ligne du fichier :" && cat geo_result.txt | wc -l

#Récupération des pays
cut -d "," -f3 geo_result.txt > pays.txt

#Calcule le nombre d'occurence de pays
cat pays.txt | sort -k 1 | uniq -c
