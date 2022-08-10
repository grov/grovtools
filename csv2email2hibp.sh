#!/bin/bash

# Premiere partie : Recuperation des emails
echo "Récupération des emails dans le fichier csv :"
#Nom du fichier source :
echo "Nom du fichier source :"
read source

echo "Le nom du fichier d'output est : email.txt"

grep -oe "[a-zA-Z0-9._]\+@[a-zA-Z]\+.[a-zA-Z]\+" $source > email.txt

sleep 2

# Deuxième partie : récupération des dataleak avec l'API Have i Been Pwned
echo "Analyse des dataleaks avec l'API Have I Been Pwned :"

# Lancement du script HIPB2.sh
bash HIBP.sh > result.txt

echo "Les résultats sont dans le fichier result.txt"
