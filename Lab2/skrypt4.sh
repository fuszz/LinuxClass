#!/usr/bin/bash

# Do zmiennych l1, l2 przypisujemy argumenty 1 i 2
l1=$1 
l2=$2

# Funkcje w Bash. Wcięcie na trzy spacje w ciele funkcji.

function dodaj(){ # W nawiasie () w bashu nie wrzucamy nazw zmiennych. Nie korzysta się z tego
   w=$[ $l1 + $l2 ] # Żeby dodać, muszę wszystko zawrzeć w nawiasie [] lub (()) (podwójny okr.)
   echo $w
}

# Zmienne umieszczane w funkcjach są globalne. Żeby wewnątrz funkcji były wartości lokalne, trzeba zapisać local. 

dodaj $l1 $l2
echo 
