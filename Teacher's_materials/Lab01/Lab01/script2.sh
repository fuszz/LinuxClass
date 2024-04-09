#!/bin/bash

#Wczytywanie danych z klawiatury
echo "Jaki jest twój  ulubiony kolor?"
read kolor
echo "Twój ulubiony kolor to: $kolor"

echo

echo "Jaki jest twój nickame ?"
odp="tata"
read
echo "$odp"

echo

echo "Podaj 3 liczby:"
read a b c
echo "Liczba w zmiennej a to: $a"
echo "Liczba w zmiennej b to: $b"
echo "Liczba w zmiennej c to: $c"

echo

#Dopisywanie danych
echo "Podaj liczbe od 4 do 10:"
read liczba
echo "Jestes ${liczba}-ty w kolejce"

echo

#Wybrane parametry read

#1)-p (znak zachety bez znaku konczacego nowej linii)
read -p "Witaj" imie
echo "$imie"

echo

#2)-a (przypisywanie kolejnych wartosci do kolejnych indeksow zmiennej tablicowej

echo "Podaj elementy tablicy: "
read -a tablica
echo "${tablica[*]}"

echo

#3)-e (brak nazwy zmiennej -> $REPLY)

echo "Witaj BASH"
read -e
echo "$REPLY"

#4)-s (nie wyswietla znakow wpisywanych przez uzytkownika)

# bez echa max przez 30 sekund
read -p "Haslo: " -s -t 30  haslo
echo $haslo
