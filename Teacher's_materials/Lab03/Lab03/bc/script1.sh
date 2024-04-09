#!/bin/bash

#sprawdzanie ustawień
echo 'limits' | bc

#podstawa liczb dla wejścia (ibase) i wyjścia (obase)
echo 'ibase' | bc
echo 'obase' | bc

echo

#sprawdzenie dokładności
echo 'scale' | bc
echo 'scale' | bc -l

echo

#proste operacje matematyczne
echo '2+4*5' | bc

echo

#pierwiastek
echo 'sqrt(16)' | bc

echo

#potega
echo '5^2' | bc

echo

#liczba eulera
echo 'e(1)' | bc -l

echo

#liczba eulera do 2 miejsc po przecinku
echo 'scale=2;e(1)' | bc -l

echo

#sinus
echo 's(45)' | bc -l

echo

#konwersja na system dwójkowy
echo 'obase=2;24' | bc

#problem 1
echo '7^7^7' | bc
