

#!/usr/bin/bash

# Wczytywanie danych z klawiatury
echo "Jaki jest Twój ulubiony kolor?"
read kolor # Nazwa zwiennej, pod który zapisana jest dana wejściowa
echo "Twój ulubiony kolor to: $kolor " 

echo "" # Wstawia pustą linię, podobnie jak samo echo bez ""

echo "Jaki jest Twój nickname?"
odp="tata"
read		# read czeka na Enter. Nie zapisuje wejścia do żadnej zmiennej.
echo $odp

echo 


echo "Podaj trzy liczby: "
read a b c # Wprowadzane liczby oddzielamy spacja, nie enterem!!!
echo "Liczba w zmiennej a to: $a" 
echo "Liczba zmiennej b to: $b"
echo "Liczba zmiennej c to: $c"

echo 

# Dopisywanie danych

echo "Podaj liczbę od 4 do 10"
read liczba
echo "Jesteś ${liczba}-ty w kolejce" # W tym wypadku nawias można pominąć, ale jeśli pominiemy -, to będzie błąd.

echo 

# Wybrane parametry read -- Przełączniki

# 1) -p daje znak zachęty bez znaku nowej linii
read -p "Witaj " imie
echo  $imie 

# 2) -a przypisuje kolejne wartości do kolejnych indeksów zmiennej tablicowej
echo "Podaj elementy tablicy: "
read -a tablica
echo ${tablica[*]}

# 3) -e Brak nazwy zmiennej, będziemy korzystać z $REPLY, która przechowuje ostatnią odpowiedź usera
# Zmienna globalna jest stała i współdzielona z różnymi użytkownikami. 
# Zmienne środowiskowe są unikatowe dla każdej z sesji.
echo "Witaj Bash"
read -e
echo ${REPLY}

# 4) -s Nie wyświetla znaków wprowadzanych przez użytkownika. 
# -t - Liczba czasów, którą ma czekać w sekundach od momentu wpisania ostatniego znaku
read -p "Hasło: " -s -t 30 haslo
echo $haslo
