#!/bin/bash

# Copie des anciens fichiers dans le répertoire OLD"
# Créer les répertoires OLD et total s'ils n'existent pas
mkdir -p OLD
mkdir -p total
echo "*** Copie des anciens fichiers dans le répertoire OLD ***"
if [ -f email.txt -a -f email_unique.txt -a -f result.txt ]; then
mv email.txt OLD/email.txt.$(date +%F_%R)
mv email_unique.txt OLD/email_unique.txt.$(date +%F_%R)
mv result.txt OLD/result.txt.$(date +%F_%R)
fi

# Première partie : Récupération des emails
echo "*** Récupération des emails dans l'extract :*** "

# Nom du fichier CSV source :
echo "*** Quel est le nom du fichier CSV source ? ***"
read source

echo "*** Le nom du fichier d'output est : email.txt ***"

grep -oe "[a-zA-Z0-9._]\+@[a-zA-Z]\+.[a-zA-Z]\+" $source > email.txt

echo "*** Suppression des doublons ***"
sort email.txt | uniq > email_unique.txt
echo "*** Les emails uniques se trouvent dans le fichier email_unique.txt ***"

sleep 2

# Deuxième partie : récupération des dataleak avec l'API Have i Been Pwned
echo "*** Analyse des dataleaks avec Have I Been Pwned : ***"

# Lancement du script HIPB2.sh
bash HIBP.sh > result.txt

echo "*** Les résultats sont dans le fichier result.txt ***"

# Copie des résultats vers le dossier total pour agréger les résultats
echo "*** Copie des résultats vers le dossier total pour agréger les résultats ***"
cat email.txt >> total/total_email.txt
cat email_unqiue.txt >> total/total_email_unqiue.txt
cat result.txt >> total/total_result.txt
