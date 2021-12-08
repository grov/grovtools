#!/bin/bash

#Affichage des colonnes
echo "URL,code_http,code_https,IP,Whois,SSLv2,SSLv3,TLS1.1,TLS1.2,TLS1.3,Ports"

#Boucle
while read url; do

#Variables
#pour le whois sur kali il faut mettre 3 "\" ici : awk -F "\\\:"
http=$(curl -o /dev/null --silent -k --head --write-out "%{http_code}" http://"$url")
https=$(curl -o /dev/null --silent -k --head --write-out "%{http_code}" https://"$url")
whois=$(whois "$url" | grep -m 1 Registrar | awk -F "\:" '{print $2}')
ping=$(ping -c 1 "$url" | head -1 | sed 's/.*(\(.*\)).*(\(.*\)).*/\1/')
SSLv2=$(testssl -p "$url" | grep -A 6 "Testing" | sed -n '/SSLv2/p')
SSLv3=$(testssl -p "$url" | grep -A 6 "Testing" | sed -n '/SSLv3/p')
TLS11=$(testssl -p "$url" | grep -A 6 "Testing" | sed -n '/TLS 1.1/p')
TLS12=$(testssl -p "$url" | grep -A 6 "Testing" | sed -n '/TLS 1.2/p')
TLS13=$(testssl -p "$url" | grep -A 6 "Testing" | sed -n '/TLS 1.3/p')
nmap=$(nmap -F --open "$url" -oG - | sed -n -e 's/^.*Ports: //p' | grep -E -o "[0-9]+" | tr '\n' ' ')

#Si cellule vide alors mettre none pour eviter les blancs
if [ -z "$http" ];
        then http="none"
fi
if [ -z "$https" ];
        then https="none"
fi
if [ -z "$whois" ];
        then whois="none"
fi
if [ -z "$ping" ];
        then ping="none"
fi
if [ -z "$SSLv2" ];
        then SSLv2="none"
fi
if [ -z "$SSLv3" ];
        then SSLv3="none"
fi
if [ -z "$TLS11" ];
        then TLS11="none"
fi
if [ -z "$TLS12" ];
        then TLS12="none"
fi
if [ -z "$TLS13" ];
        then TLS13="none"
fi
if [ -z "$nmap" ];
        then nmap="none"
fi

#Echo les commandes separées par une virgule
echo $url | tr "\n" ", "
echo $http | tr "\n" ", "
echo $https | tr "\n" ", "
echo $ping | tr "\n" ", "
echo $whois | tr "\n" ", "
echo $SSLv2 | tr "\n" ", "
echo $SSLv3 | tr "\n" ", "
echo $TLS11 | tr "\n" ", "
echo $TLS12 | tr "\n" ", "
echo $nmap

done < url.txt
