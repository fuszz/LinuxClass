#!/bin/bash

<<KOMENTARZ

Parametry sed:
-n – na wyjściu będą wypisywane jedynie linie, na których wykonano 
     komendę p lub s z parametrem p.
-e – stosujemy, gdy przetwarzamy wiele poleceń lub skryptów.
-f – dzięki temu argumentowi, wczytujemy komendy z pliku.
-v – wyświetlenie informacji o programie.
-t – wyłączenie wyjścia z istotnych komend powłoki, które są wykonywane.
-q – likwiduje ostrzeżenia o rezultatach podstawienia.
-i – edycja w miejscu, zapisuje zmiany do oryginalnego pliku
-b – zapisanie kopii zapasowej oryginalnego pliku.

Składnia:
sed 's/stary/nowy/' plik

KOMENTARZ

#Przykład1 - usuwanie linii
sed -e '1d' -e '2d' -e '7d' ksiazki2.txt

echo

#Przykład2 - zastapienie wyraz1 przez wyraz2(pierwsze wystapienie)
sed 's/Proces/Wyrok/' ksiazki2.txt

echo

#Przyklad3 - zastapinie wyraz1 przez wyraz2(globalne)
sed 's/Proces/Wyrok/g' ksiazki2.txt

echo

#Przykład4 - zastąpienie wielu wyrazów - metoda 1
sed 's/Proces/Wyrok/' ksiazki2.txt > ksiazki2m.txt | sed 's/Mały/Duży/' ksiazki2m.txt

echo

#Przykład5 - zastąpienie wielu wyrazów - metoda 2
sed 's/Proces/Wyrok/;s/Mały/Duży/' ksiazki2.txt
