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
