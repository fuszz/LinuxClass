#!/bin/bash

#Przykład1 - kropka
echo -e "kot\nplot\npot\npit\npat" | awk '/p.t/'

echo

#Przykład2 - początek linii
echo -e "Test\nTenis\nTeraz\nTenor" | awk '/^Ten/'

echo

#Przykład3 - konic linii
echo -e "kot\nplot\npot\npit\npat" | awk '/ot$/'

echo

#Przykład4 - dopasowanie
echo -e "kot\nlot\npot\npit\npat" | awk '/[pl]ot/'

echo

#Przykład5 - poza dopasowaniem
echo -e "kot\nlot\npot\npit\npat" | awk '/[^pl]ot/'

echo

#Przykład6 - alternatywa
echo -e "kot\nlot\npot\npit\npat" | awk '/pot|lot/'

echo

#Przykład7 - zero lub jedno wystąpienie
echo -e "sto\nstos" | awk '/stos?/'

echo

#Przykład7 - zero lub więcej wystąpień
echo -e "sto\nstop\nstopp" | awk '/stop*/'

echo

#Przykład8 - jedno lub więcej wystąpień
echo -e "112\n242\n123\n331\n456\n222" | awk '/2+/'

#Przykład9 - grupowanie
echo -e "Nowy traktor\nNowy rower\nNowy samochod\nNowy kombajn" \
  | awk '/Nowy (traktor|kombajn)/'
