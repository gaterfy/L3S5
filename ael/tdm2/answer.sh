#!/bin/bash
# Indique au système que l'argument qui suit est le programme utilisé pour exécuter ce fichier
# En règle générale, les "#" servent à mettre en commentaire le texte qui suit comme ici
echo "Q1 :"
egrep --color 'nez' Cyrano.txt

echo "Q2":
egrep "\([^()]*\)"  Cyrano.txt --color=auto
echo "test":
egrep "\([^()]*\)" --color=auto test.txt

echo "Q3":

egrep "\<[[:alpha:]]{4}\>" --color=auto Cyrano.txt

echo "Q4 :"

egrep "^[^ ]+ :" -o  --color Cyrano.txt

echo "Exercice 2"

echo "Q1 :"
valeurAttribut="&(([a-zA-Z]|:|_)+([a-zA-Z0-9]|:|_|-|\.)*);"
egrep -m 10 --color  $valeurAttribut html/fil.html


echo "Q2 :"
nomXML="('(([^'\\]*)(\\'|\\\\)*)*')*)"

refEntite="([a-zA-Z]|:|_)+([a-zA-Z0-9]|:|_|-|\.)*"

baliseOuvrante="([^<&]|$valeurAttribut)"
grep $baliseOuvrante html/fil.html --color

#echo "Q3 :"

egrep --color=auto '\+33[[:space:]]*\(0\)[[:space:]]*3(\.[0-9]{2})' html/*.html

echo "exercice 3"
echo "----------"

echo "Q1:"
adresse_bis_ter='.*,[0-9]*(BIS|TER),.*'
egrep  $adresse_bis_ter bano-59009.csv -o

echo "Q2:"
egrep '.*,.*,Ruelle.*,.*' bano-59009.csv -o

echo "--Q3:"
egrep -m 10 '.*,[0-9]*[^a-z]*,.*' bano-59009.csv  -o
