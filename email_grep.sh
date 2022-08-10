#!/bin/bash
#Nom du fichier source : 
Echo "Nom du fichier source :"
read souce

#Nom du fichier d'output :
Echo "Nom du fichier output :"
read output

grep -oe "[a-zA-Z0-9._]\+@[a-zA-Z]\+.[a-zA-Z]\+" $source > $output
