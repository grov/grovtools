#!/bin/bash

# Copie des anciens fichiers dans le répertoire OLD"
echo "*** Copie des anciens fichiers dans le répertoire OLD ***"
mv email.txt OLD/email.txt.$(date +%F_%R)
mv email_unique.txt OLD/email_unique.txt.$(date +%F_%R)
mv result.txt OLD/result.txt.$(date +%F_%R)


# Première partie : Récupération des emails
echo "*** Récupération des emails dans l'extract :*** "

#Nom du fichier source :
echo "*** Nom du fichier source : ***"
read source

echo "*** Le nom du fichier d'output est : email.txt ***"

grep -oe "[a-zA-Z0-9._]\+@[a-zA-Z]\+.[a-zA-Z]\+" $source > email.txt

echo "*** Suppression des doublons ***"
sort email.txt | uniq > email_unique.txt
echo " *** Les emails uniques se trouvent dans le fichier email_unique.txt ***"

sleep 2

# Deuxième partie : récupération des dataleak avec l'API Have i Been Pwned
echo "*** Analyse des dataleaks avec Have I Been Pwned : ***"

# Lancement du script HIPB2.sh
bash HIBP2.sh > result.txt

echo "*** Les résultats sont dans le fichier result.txt ***"
