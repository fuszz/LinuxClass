#!/usr/bin/bash
#============================================================================
# Autor:      fussz
# Data:       12 mar 2024
# Polecenie:  Napisz skrypt w pliku o nazwie info.sh, który będzie
#             wyświetlał informacje o działającym systemie. Program ma
#             mieć następującą funkcjonalność:
#             1) wyświetlanie informacji o wolnej przestrzeni dyskowej (-hd);
#             2) wyświetlanie informacji o wolnej pamięci ram (-ram);
#             3) wyświetlanie informacji o procesorach zainstalowanych w
#                jednostce głównej (-cpu);
#             4) wyświetlenie wszystkich powyższych (-all).
#============================================================================


function hd(){
  echo -e "Partycja \tWolne miejsce"
  df -h | column -t -o $'\t' | cut -d $'\t' -f 1,4 | tail -n +2
}

function ram(){
  echo -n "Ilość wolnej pamięci RAM: "
  free -h | column -t -o $'\t' | cut -d $'\t' -f 4 | head -n 2 | tail -n +2
}

function cpu(){
  echo "Wyświetl info o procesorach zainstalowanych w jednostce głównej"
  cat /proc/cpuinfo
}

function all(){
  hd
  echo
  ram
  echo
  cpu
}
if [ "$1" = "-hd" ]; then
  hd
elif [ "$1" = "-ram" ]; then
    ram
elif [ "$1" = "-cpu" ]; then
    cpu
elif [ "$1" = "-all" ]; then
    all
else
    echo "Niepoprawna opcja"
    exit 0
fi
