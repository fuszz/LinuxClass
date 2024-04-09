#!/usr/bin/bash

# Sprawdzenie ustawień kalkulatora bc
echo "limits" | bc

# Podstawa liczb dla wejścia (ibase) i wyjścia (obase)
echo
echo "Podstawa systemu liczb: domyślnie decymalny"
echo "ibase" | bc
echo "obase" | bc

echo
# Sprawdzenie dokładności dla kalkulatora bc w formie standardowej i rozszerzonej
echo "scale" | bc # Standardowo: liczby dziesiętne
echo "scale" | bc -l # Z funkcjami matematycznymi: domyślnie 20 miejsc po przecinku
echo

echo
# Proste operacje matematyczne
echo "2+4*5" | bc # On umie w kolejność wykonywania działań.

#Pierwiastek z liczby:
echo "sqrt(16)" | bc # Działa w trybie standardowym - jeśli pierwiastek jest liczbą całkowitą

# Potęga
echo "3^3" | bc

# Liczba Eulera - tu już potrzebujemy bibliotek matematycznych -> -l
echo "e(1)" | bc -l

# Liczba Eulera do drugiego miejsca po przecinku
echo "scale=2; e(1)" | bc -l # On tu nie zaokrągla, po prostu ucina.  scale=2 ustawia precyzję na dwie liczby po przecinku

# Sinus
echo "s(45)" | bc -l 

# Konwersja na system dwójkowy - obase, czyli system wyjściowy
echo "obase=2; 24" | bc -l

# Problem1 - przy dużych i skomplikowanych obliczeniach obciąża dosyć długo procesor na niemały czas, ale wykorzystuje jeden wątek.
echo "7^7^7" | bc
