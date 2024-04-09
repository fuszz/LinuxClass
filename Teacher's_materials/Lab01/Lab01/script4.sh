#!/bin/bash

l1=$1
l2=$2

#Funkcje
function dodaj(){
	w=$(( $1 + $2 ))
        echo $w
}

dodaj $l1 $l2
echo
