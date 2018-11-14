# grovtools
Petits outils pratiques

* **Ping.sh** :
Permet de pinger des URLs et de retourner l'adresse IP sous le format : Domain_Name IP_Adress. Il faut fournir en amont une liste d'URLs dans un fichier ping.txt
* **Dig.sh** permet pareil de récupérer l'IP avec la commande dig
* **http_response.sh** permet de récupérer le code http de l'URL (200, 301 etc...) avec curl
* **whois** permet de récupérer le REGISTRAR uniquement

#### Exemples : 

###### Exemples de whois.sh :
```
root@toto:/# bash whois.sh
perdu.com        whois.dreamhost.com
example.com      whois.iana.org
```
###### Exemples de ping.sh :
```
root@Yoann:/home/grov# bash ping.sh
perdu.com       208.97.177.124
example.com     PING example.com(2606:2800:220:1:248:1893:25c8:1946 (2606:2800:220:1:248:1893:25c8:1946)) 56 data bytes
```
IP v6 ... pas de bol ... no comments

###### Exemples de http_response.sh :
```
root@Yoann:/home/grov# bash http_response.sh
perdu.com       200
example.com     200
```
###### Exemples de dig.sh :
```
root@Yoann:/home/grov# bash dig.sh
perdu.com       208.97.177.124
example.com     93.184.216.34
```
