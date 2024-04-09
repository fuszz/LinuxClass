#!/usr/bin/bash

<<KOMENTARZ
na początku i końcu komentarza musi być to samo słowo.
Deskryptory plików. 
   0 - deskryptor wejściowy
   1 - deskryptor wyjściowy
   2 - deskryptor wyjściowy błędów służy do odseparowania wylotu błędów. Nie chcemy, żeby nasz użytkownik widział wszystkie warningi które nie mają znaczenia
     - Należy to wywalić na /dev/null, żeby nie zasypać końcowego użytkownika.
KOMENTARZ

# Przykład 1: utworzenie pliku z zawartością.
ls > plik.txt

# Przykład 2: utworzenie pliku z zawartością wykorzystaniem deskryptora wyjściowego
# exec 1>"plik1.txt" # Przekierowanie standardowego wyjścia na plik plik1.txt
# ls >&1

# Przykład 3: Połączenie dwóch plików w całość
echo "Witaj w Slackware" > plik1.txt
echo "Powtórka z bash" > plik2.txt
cat plik1.txt plik2.txt > plik12.txt

# Przykład 4: Dopisywanie danych do pliku
echo "Cwiczenia" >>  plik12.txt # za pomocą >> DOPISUJEMY do pliku

# Przykład 5: Przekierowanie strumieni 
# exec 2>&1 # 2 (czyli wyjście 2 przekierowujemy na standardowe wyjście)
# echo "Testujemy" > /dev/null >&2 # Normalnie pójdzie w eter (/dev/null), jeśli przekierujemy na wyjście 2, to trafi na standardowe wyjście błędów

# Przykład 6: Potoki
ls -a | grep ".txt" # to jest przykład potoku nienazwanego

# Potoki nazwane
mkfifo myPipe # Tworzę nowy potok nazwany myPipe. Pipe jest plikiem, chronimy go za pomocą uprawnień
ls -al > myPipe # Przekazuję na potok myPipe wynik ls -al
grep ".txt" < myPipe # Na wejście grepa przekazuję potok myPipe
#    	plik z pipem zostaje, chyba, że go ręcznie skasujemy.
