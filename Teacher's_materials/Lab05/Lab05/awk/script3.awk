#!/bin/awk -f

BEGIN { print FS = "," }

#wyswietlanie wszystkich linii
#{ print $0 }

#wyswietlanie 1 komlumny
#{ print $1 }

#wyswietlanie 1 i 3 kolumny
#{ print $1 "\t" $3 }

#wyswietlanie kolumn w różnej kolejnosci
#{ print $3 "\t" $1 }

#wyswietlanie linii, które spełniają wzorzec
#/female/ { print $0 }
#/some hi*/ { print $0 }

#liczenie wierszy, które spelniaja wzorzec
#/female/ { ++ile }
#END { print "Ilosc = ", ile }

#wyswietlanie linii, ktore maja okreslona liczbe znakow
#length($0) < 68
