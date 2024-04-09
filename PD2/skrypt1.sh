#!/usr/bin/bash
#=========================================================================
# Autor:      Filip Uliasz
# Data:       24 mar 2024
# Polecenie: Zapoznaj się z przykładowymi programami wykorzystującymi okna
#            dialogowe. Programy dostępne są w następującym folderze:
#            /usr/share/doc/dialogs/examples. Proszę zmodyfikować wybrany
#            skrypt i dostosować go do zadania 2 z bash.
#            Uzasadnić wybór skryptu. (1 pkt)
# Wybrany skrypt: menubox2
# Uzasadnienie: W poleceniu zakładam, że użytkownik ma mieć możliwość
#               wyboru jednego i tylko jednego sposobu działania mojego
#               poprzedniego skryptu, więc menubox jest do tego celu
#               idealny. Wybrałem menubox2, bo ma to, czego potrzebuję
#               (tj menu i info o wprowadzonych przez użytkownika danych)
#               ale bez innych udziwniaczy.
#=========================================================================

dialog --clear --title "SKRYPT 1" \
        --menu "Wybierz co chcesz zrobić:" 11 80 4 \
        "CPU"  "Wyświetl informacje o procesorach" \
        "kernel" "Wyświetl informacje o jądrze Linuxa" \
        "whoAmI"   "Wyświetl nazwę obecnie zalogowanego użytkownika" \
        "home" "Wyświetl katalog domowy obecnie zalogowanego użytkownika" 2>chwilka

returncode=`cat chwilka`
rm chwilka

if [ "$returncode" == "CPU" ]; then
        clear
        dialog --title "Informacje o procesorach" --msgbox "`cat /proc/cpuinfo`" 40 100
elif [ "$returncode" == "kernel" ]; then
        clear
        dialog --title "Informacje o jądrze systemu" --msgbox "`cat /proc/version`" 20 80
elif [ "$returncode" == "whoAmI" ]; then
        clear
        dialog --title "Nazwa użytkownika" --msgbox "`whoami`" 8 30
elif [ "$returncode" == "home" ]; then
        clear
        dialog --title "Katalog domowy użytkownika" --msgbox "`ls -l ~`" 20 100
else
        clear
        dialog --msgbox "Anulowano" 8 20
fi
clear
