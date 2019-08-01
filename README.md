# grovtools
Petits outils pratiques :
* **Ping.sh** :
Permet de pinger des URLs et de retourner l'adresse IP sous le format : Domain_Name IP_Adress. Il faut fournir en amont une liste d'URLs dans un fichier ping.txt
* **Dig.sh** permet pareil de récupérer l'IP avec la commande dig
* **http_response.sh** permet de récupérer le code http de l'URL (200, 301 etc...) avec curl
* **whois** permet de récupérer le REGISTRAR uniquement
* **Discoweb** : permet d'obtenir : URL, code http, code https, IP
* **Discowebv2** : Comme discoweb mais avec l'ajout des protocoles SSL/TLS + les ports ouverts nmap

**NB :** Discowebv2 nécessite [testssl.sh](https://testssl.sh) et [nmap](https://nmap.org/).

**NB2 :** Mon code est dégeulasse mais il marche ...

#### Exemples : 

###### Exemples de whois.sh :
```
root@toto:/# bash whois.sh
perdu.com        whois.dreamhost.com
example.com      whois.iana.org
```
###### Exemples de ping.sh :
```
root@toto:/# bash ping.sh
perdu.com       208.97.177.124
example.com     PING example.com(2606:2800:220:1:248:1893:25c8:1946 (2606:2800:220:1:248:1893:25c8:1946)) 56 data bytes
```
IP v6 ... pas de bol ... no comments

###### Exemples de http_response.sh :
```
root@toto:/# bash http_response.sh
perdu.com       200
example.com     200
```
###### Exemples de dig.sh :
```
root@toto:/# bash dig.sh
perdu.com       208.97.177.124
example.com     93.184.216.34
```
###### Exemples de discoweb.sh :
```
root@toto:/# bash discoweb.sh
perdu.com       301,200,208.97.177.124
example.com     200,200,93.184.216.34
```
###### Exemples de discowebv2.sh :
```
root@toto:/# bash discoweb.sh
perdu.com       301,200,208.97.177.124,SSLv2 not offered (OK),SSLv3 not offered (OK),TLS 1.1 not offered,TLS 1.2 offered (OK),22-80-443-

example.com     200,200,93.184.216.34,SSLv2 not offered (OK),SSLv3 not offered (OK),TLS 1.1 offered,TLS 1.2 offered (OK),22-80-443-8080-

```
