#!/usr/bin/bash
#=========================================================================
# Autor:      Filip Uliasz
# Data:       24 mar 2024
# Polecenie: Napisz skrypt korzystający z okna dialogowego w celu
#            utworzenia formularza. Formularz powinien zawierać
#            następujące pola:
#                   • Imię          • Nazwisko
#                   • Adres E-mail  • Login
#                   • Hasło         • Hobby
#            Po podaniu wszystkich danych i kliknięciu ok powinno wyświetlić
#            się okno do wyboru lokalizacji zapisu pliku z danymi.
#            Dane do pliku powinny być dopisywane.
#=========================================================================


dialog  --form "Formularz" 10 40 5 \
    "Imię"      1 1 "" 1 10 50 0 \
    "Nazwisko"  2 1 "" 2 10 50 0 \
    "E-mail"    3 1 "" 3 10 50 0 \
    "Hasło"     4 1 "" 4 10 50 0 \
    "Hobby"     5 1 "" 5 10 50 0 2>tmp_file

if [ $? -eq 1 ] || [ $? -eq 255 ]; then
    dialog --msgbox "Anulowano"  8 20
    exit
fi

dialog  --title "Wybierz lokalizację do zapisu formularza" \
    --fselect /home/`whoami`/ 20 60 2>tmp_path

if [ $? -eq 1 ] || [ $? -eq 255 ]; then
    dialog --msgbox "Anulowano"  8 20
   exit 0
fi

echo "Formularz: `date`">> "`cat tmp_path`"
echo "`cat tmp_file`" >> "`cat tmp_path`"
echo >> "`cat tmp_path`"

rm tmp_file
rm tmp_path
clear
