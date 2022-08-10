#!/bin/bash

#Boucle
while read email; do

#Variables
curl=$(echo $email && echo " : " &&  curl -H "hibp-api-key:$(cat .hibp.secret)" -H "user-agent: Beyond the Frame" -sS https://haveibeenpwned.com/api/v3/breachedaccount/$email)
echo $curl

#pour eviter le rate limiter de l'api
sleep 3

done < email.txt
