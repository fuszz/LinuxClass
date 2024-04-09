#!/bin/bash

<<KOMENTARZ
Deskryptoty

0 - standardowe wejscie
1 - standardowe wyjscie
2 - standardowe wyjscie bledow 

KOMENTARZ

#Przyaklad 1 (utworzenie pliku z zawartoscia)
ls > pliki.txt

#Przyklad 2 (utworzenie pliku z zawartoscia wykorzystujac deskryproty)
#exec 1> "pliki1.txt" 
#ls >&1

#Przyklad 3 (Polaczenie 2 plików w closc)
echo "Witaj w Slackware" > plik1.txt
echo "Powtorka z bash" > plik2.txt
cat plik1.txt plik2.txt > plik12.txt

#Przyklad 4 (Dopisywanie danych do pliku)
echo "Cwiczenia" >> plik12.txt

#Przyklad 5 (Przekierowanie strumieni)
exec 2>&1
echo 'Testujemy' > /dev/null >&2 

#przyklad 6 (potoki)
ls -a | grep ".txt"

#przyklad 7 (potoki nazwane)
mkfifo myPipe
ls -all > myPipe
grep ".txt" < myPipe
