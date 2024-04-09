#!/usr/bin/bash

#Komentarz

#Deklaracja zmiennych
a="Pierwsza zmienna"
echo $a

#Apostrofy
echo 'Tekst: $a'
echo
echo "Tekst: $a"
echo "Tekst: \$a"

echo `ls -a`

#Jak inaczej uruchomić poelcenie?

echo $( ls -a )

# Zmienne lokalne
a="Zmienna lokalna"
echo 
katalog=`pwd`
echo "Jesteś w katalogu $katalog"

katalog=$( pwd )
echo "Jesteś w katalogu $katalog"

#Zmienne specjalne

echo "Parametry skryptu: $@"
echo "Nazwa skryptu: $0"
echo "Wynik wykonania następnego polecenia: $?"
echo "ID powłoki, która wykonuje skrypt: $$"

#środowiskowe lokalne:

#t="T"
#echo $t
#bash
#echo $t

#globalne
#export t
#export -n t -- usunięcie atrybutu zmiennej globalnej

#echo $( export -p )

#echo `env`

echo

# Tablice - zmienne tablicowe
# 	Tablice są indeksowane od 0 !!!
tablica=(10 2 3 4 5) # NAWIASY OKRĄGŁE

echo ${tablica[0]} # Wyświetla pierwszy element z tablicy
echo ${tablica[*]} # Wyświetla wszystkie elementy z tablicy
echo ${tablica[@]} # Wyświetla wszystkie elementy z tablicy, ale inaczej jest w pętlach i instrukacj warunkowych

echo ${#tablica[0]} # Wyświetli liczbę znaków danego elementu tablicy

# Dodawanie elementu do tablicy
tablica[8]=6 # Ale tak dorzuca pod 8. indeks w tablicy
echo ${tablica[*]}
echo ${tablica[5]} # Element pusty
# Indeksy są liczbowe, ale nie ma konieczności, by były po kolei.
echo ${tablica[8]} # Tu wyświetli wartość '6'

# Pojedyncze tworzenie tablicy:
tab[0]="Tak"
tab[1]="Nie"
echo ${tab[*]}

# Usuwanie elementów tablicy
unset tablica[3] 
echo ${tablica[*]} 

# Usuwanie całej tablicy
unset tablica[*] 
echo ${tablica[@]} # W praktyce tablica pusta (bez elementów) po prostu nie istnieje. 
