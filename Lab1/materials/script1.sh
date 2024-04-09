#!/bin/bash

#Komentarz

#Deklaracja zmiennych
a="Pierwsza zmienna"
echo $a

#apostrofy
echo 'Tekst: $a'
echo "Tekst: $a"
echo "Teskt: \$a"
echo `ls -a`
echo
#alternatywna metoda wykonania polecenia
echo $(ls -a)
echo

#Rodzaje zmiennych
# Zmienne lokalne
b="Zmienna lokalna"
katalog=`pwd`
echo "Jestes w katalogu $katalog" 

katalog=$(pwd)
echo "Jestes w kaalogu $katalog"

#Zmienne specialne
echo "$0"
echo "$@"
echo "Prametry skryptu: $@"

echo "$?" #kod poworotu ostatnio wykonanego polecenia
echo "$$" #pid procesu biezacej powloki


#Zmienne srodowiskowe

#lokalne
#t="Tekst"
#echo "$t"
#bash
#echo "$t"

#globalne
export t="Tekst"

#usuniecie atrybutu eksportu dla danej zmiennej
export -n zmienna

#wyswietlenia zmiennych globalnych
#echo $(export -p)

#wyswietlenie zmiennych srodowiskowych
#echo `env`

echo
#zmienne tablicowe
tablica=(1 2 3 4 5 6)
echo ${tablica[0]}
echo ${tablica[*]}
echo ${tablica[@]}

#liczba znakow danego elemntu tablicy
echo ${#tablica[0]}

#dodawanie elementow do tablicy
tablica[6]=7
echo ${tablica[*]}

tab[0]="Tak"
tab[1]="Nie"
echo ${tab[@]}

#usuwanie elementow tablicy
unset tablica[3]
echo ${tablica[@]}

#usuwanie calej tablicy
unset tablica[*]
echo ${tablica[@]}
