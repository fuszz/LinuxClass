#!/bin/awk -f

#ARGC - ilość parametrów
#BEGIN { print "Parametry = ", ARGC }

#ARGV
BEGIN {
  for ( i = 0; i < ARGC - 1; ++i ) {
     printf "ARGV[%d] = %s\n", i, ARGV[i]
  }
}

#CONVFMT - format liczby
BEGIN { print "Format liczby = ", CONVFMT }

#ENVIRON - tablica zminnych środowiskowych
BEGIN { print ENVIRON["USER"] }

#FILENAME - nazwa pliku (parametr) - tylko blok END
END { print FILENAME }

#NF - ilość column
BEGIN {}
NF > 6

#NR - ilość column w aktualnym rekordzie (wierszu)
BEGIN {}
NR > 6

#FNR - podobny do NR. Użyteczny przy wielu plikach. 
#Resetuje wartość gdy nowy plik

#OFMT - format wyjściowy liczby
BEGIN { print "OFMT = ", OFMT }

#OFS - seperator wyjsciowy dla pól(kolumn). Domyślnie spacja
BEGIN { print "OFS = ", OFS }

#ORS - seperator wyjściowy dla recordów (wierszy). Domyslnie nowa linia
BEGIN { print "ORS = ", ORS }

#RLENGTH - długość stringa dopasowana przez funkcje match
BEGIN { if ( match("czerowny niebieski zielony", "ony")) { print RLENGTH } }

#RS - seperator wejściwy dla rekordów. Wartość domyslna to nowa linia
BEGIN { print "RS = ", RS }

#RSTART - pierwsza pozycja stringa dopasowanego przez funkcje match
BEGIN { if ( match("czerowny niebieski zielony", "zie")) { print RSTART } }

#SUBSEP - znak seperatora dla indeksów tablic. Domyślnie \034
BEGIN { print "SUBSEP = " SUBSEP }
