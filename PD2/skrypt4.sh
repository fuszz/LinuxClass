#!/usr/bin/bash
#=========================================================================
# Autor:      Filip Uliasz
# Data:       25 mar 2024
# Polecenie:  Korzystając z programu bc napisać skrypt obliczający
#             z dowolną dokładnością (sprawdzić max dokładność dla bc)
#             miejsca zerowe wielomianu, liczbę pi oraz złotą liczbę.
#             Użytkownik powinien móc sobie wybrać co chce by zostało
#             wyliczone/podane. Wykorzystaj okna dialogowe. (2 pkt)
#=========================================================================


function miejsca_zerowe(){

    max_scale=`echo "limits" | bc | grep "BC_SCALE_MAX" | tr -cd '[:digit:]'`

    dialog --form "Obliczanie miejsca zerowego wielomianu postaci W(x)=ax+b" 10 60 3 \
        "a"  1 1 "" 1 30 50 0 \
        "b"  2 1 "" 2 30 50 0 \
        "precyzja (max: "$max_scale")" 3 1 "" 3 30 50 0 2>$$idk

    if [ $? -eq 1 ] || [ $? -eq 255 ]; then
      dialog --msgbox "Anulowano"  8 20
      rm $$idk
      return
    fi
    {
    read a
    read b
    read p
    }<$$idk
    rm $$idk
    if [ $a -eq 0 ]; then
        if [ $b -eq 0 ]; then
            result="Każda liczba rzeczywista"
        else
            result="Brak rozwiązań"
        fi
    else
        result=$(echo "scale=$p; -$b/$a" | bc )
    fi
    dialog --msgbox "Wynik: $result" 10 40
}

function pi(){

    max_scale=`echo "limits" | bc | grep "BC_SCALE_MAX" | tr -cd '[:digit:]'`

    dialog --clear --inputbox "Podaj precyzję \n(max $max_scale): " 8 30 2>$$idk
    if [ $? -eq 1 ] || [ $? -eq 255 ]; then
      dialog --msgbox "Anulowano"  8 20
      rm $$idk
      return
    fi

    p=`cat $$idk`
    rm $$idk
    result=$(echo "scale=$p; 4*a(1)" | bc -l)
    echo "$result"
    dialog --msgbox "Wynik: $result" 10 40
}

function golden_number(){

    max_scale=`echo "limits" | bc | grep "BC_SCALE_MAX" | tr -cd '[:digit:]'`

    dialog --clear --inputbox "Podaj precyzję \n(max $max_scale): " 8 30 2>$$idk
    if [ $? -eq 1 ] || [ $? -eq 255 ]; then
      dialog --msgbox "Anulowano"  8 20
      rm $$idk
      return
    fi
    p=`cat $$idk`
    rm $$idk
    result=$(echo "scale=$p; (1+sqrt(5))/2" | bc -l)
    echo "$result"
    dialog --msgbox "Wynik: $result" 10 40
}

dialog --clear --menu "Zadanie 3 - kalkulator bc" 10 50 3 \
        1 "Oblicz miejsca zerowe wielomianu" \
        2 "Oblicz liczbę pi" \
        3 "Oblicz złotą liczbę" 2>$$check

    if [ $? -eq 1 ] || [ $? -eq 255 ]; then
      dialog --msgbox "Anulowano"  8 20
      rm $$check
      exit
    fi
check=`cat $$check`
rm $$check
echo "$check"

case $check in
    1) miejsca_zerowe ;;
    2) pi ;;
    3) golden_number ;;
esac
clear
