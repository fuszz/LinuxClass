#!/usr/bin/bash

# Proste okno dialogowe
# dialog --title "Wiadomość" --msgbox "Witaj w oknie dialogowym" 5 30
# dialog <tytuł>           <rodzaj>  <zawartość>           <wys> <szer> 


# okno z przyciskiem YES NO
#dialog --title "Tak / Nie" --yesno "Lubisz dżem?" 6 30
clear

# okno informacyjne
#dialog --title "Informacja" --infobox "Proszę czekać..." 10 30; sleep 4 # Odczytuje 4 s
clear

# Okno do wprowadzania danych
# Uwaga - okna dialogowe korzystają z deskryptora błędów.
# To, co wprowadzamy z klawiatury ląduje na deksryptorze błędów
# Bo 0 wykorzystujemy wpisując dane, 1 - wyświetlanie okna, zatem zostało po prostu 2 - stderr.  
#dialog --inputbox "Podaj swoje imię" 8 40 2>er$$
clear

# Okno do wyświetlania tekstu
# dialog --textbox /etc/profile 22 70

# Okna dialogowe są wyświetlane w języku systemu. Można to jakoś zmienić, ale Schneider nie wie jak

# Okno z MENU
# dialog --menu "Wybierz kolor:" 10 30 3 1 czerwony 2 zielony 3 niebieski  
#			   <szer><wys><liczbaopcji><nr opcji - opcja>...
clear


# Okno z listą opcji wielokrotnego wyboru
# Zaznaczamy spacją
#dialog --checklist "Wybierz podzespoły" 10 60 3 \
#    1 "CPU" off\
#    2 "GPU" off\
#    3 "RAM" on


# Okno z listą pojedynczego wyboru
#dialog --backtitle "Wybór notebooka" \
#    --radiolist "Wybierz producetna: "\
#    10 40 4 \
#    1 "Asus" off \
#    2 "Acer" on \
#    3 "Dell" off \
#    4 "Lenovo" off



# okno do wprowadzania hasła
#dialog --title "Wprowadzanie hasła" \
#    --passwordbox "Podaj hasło" 8 40 \
#    2>haslo.txt

# Okno z wyborem pliku
#dialog --fselect /home/student/dialog 10 40 2>sciezka.txt


# Okno z paskiem postępu
#licznik=0
#while [ $licznik -lt 100 ]
#do
#  licznik=$[ licznik+1 ]
#  echo $licznik | dialog --gauge "Postep" 8 40
#done


#Okno do ustawiania czasu
# dialog --clear --timebox "Ustaw zegar" 3 8 14 11 59 2>godz.txt


# okno kalendarza

dialog --calendar "Kalendarz" 0 0 20 3 2025 2>data.txt
