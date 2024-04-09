#!/usr/bin/bash

#================================================================================
# Autor:      fussz
# Data:       12 mar 2024
# Polecenie:  Napisz funkcję zamień, która przyjmuje 2 argumenty. Pierwszy
#             określa wyszukiwane słowo, a drugi - słowo na które wyszukane
#             słowo ma być zamienione. Obrabiany tekst pobierany jest ze
#             strumienia wejścia, a obrobiony tekst trafia do strumienia wyjścia.
#================================================================================

function zamien(){
echo "Podaj tekst wejściowy"
read -e
echo ${input//"${1}"/"${2}"}
}

zamien $1 $2
