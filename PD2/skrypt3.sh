#!/usr/bin/bash
#=========================================================================
# Autor:      Filip Uliasz
# Data:       24 mar 2024
# Polecenie:  Proszę zmodyfikować zadanie 1 pkt2 z bash w celu
#             korzystania z okna dialogowego.
#=========================================================================

<<KOMENTARZ
   - utworzyć: -mkf -mkd (filename/dirname)
   - usunąć: -rmf -rmd (filename/dirname)
   - skopiować: -cpf -cpd (filename/dirname)
   - przenieść: -mvf -mvd (filename/dirname)
   - utworzyć foldery podane w ścieżce: -path
KOMENTARZ

function make_file(){ # Tworzy pusty plik o nazwie podanej w argumencie $1
   echo > $1
}

function make_dir(){ # Tworzy pusty folder o nazwie podanej w argumencie $1
   mkdir $1
}

function remove_file(){ # Usuwa plik o nazwie $1
  if [ -f $1 ]; then
    dialog --clear --yesno "Czy na pewno chcesz usunąć plik $1?" 8 40

    if [ $? -eq 1 ] || [ $? -eq 255 ]; then
     dialog --msgbox "Anulowano"  8 20
     return
    fi

    if [ $? -eq 0 ]; then
        rm $1
        dialog --clear --msgbox "Usunięto plik $1." 8 40
    else
        dialog --clear --msgbox "Anulowano." 8 40
    fi

  else
    dialog --clear --msgbox "Nie istnieje plik o nazwie $1" 8 40
  fi
}

function remove_dir(){ # Usuwa katalog o nazwie $1, o ile istnieje
if [ -d $1 ]; then
    dialog --clear --yesno "Czy na pewno chcesz usunąć katalog? $1?" 8 40

    if [ $? -eq 1 ] || [ $? -eq 255 ]; then
      dialog --msgbox "Anulowano"  8 20
      return
    fi

    if [ $? -eq 0 ]; then
      rm -rdf $1
      dialog --clear --msgbox "Usunięto katalog $1." 8 40
    else
      dialog --clear --msgbox "Anulowano." 8 40
    fi
  else
    dialog --clear --msgbox "Nie istnieje katalog o nazwie $1" 8 40
  fi
}

function copy_file(){ # kopiuje plik $1
  if [ -f "$1" ]; then
    cp $1 "kopia-""$1"
    dialog --clear --msgbox "Skopiowano do kopia-$1." 8 40
  else
    dialog --clear --msgbox "Nie istnieje plik o nazwie $1." 8 40
  fi
}

function copy_dir(){ # kopiuje zawartość katalogu $1 do katalogu kopia_$1
  if [ -d "$1" ]; then
    cp -r "$1" "kopia-""$1"
    dialog --clear --msgbox "Skopiowano do kopia-$1." 8 40
  else
    dialog --clear --msgbox "Nie istnieje katalog o nazwie $1." 8 40
  fi
}


function move_file(){ # przenosi plik $1 do katalogu $2
  if [ -f "$1" ] && [ -d "$2" ]; then
    mv "$1" "$2"
    dialog --clear --msgbox "Przeniesiono plik $1 do katalogu $2" 8 40
  else
    dialog --clear --msgbox "Podany plik lub katalog nie istnieje" 8 40
  fi
}

function move_dir(){
  if [ -d "$1" ] && [ -d "$2" ]; then
    mv -ft "$2" "$1"
    dialog --clear --msgbox "Przeniesiono katalog $1 do katalogu $2" 8 40
  else
    dialog --clear --msgbox "Jeden z katalogow nie istnieje" 8 40
  fi
}

function make_path(){ # Tworzy foldery tak, by ścieżka $1 istniała
  mkdir -p "$1"
  dialog --clear --msgbox "Zapewniono istnienie ścieżki $1" 8 40
}

dialog --clear --menu "Menu: zad 1a Lab 1" 15 50 10 \
        "mkf" "Tworzenie pliku" \
        "mkd" "Tworzenie katalogu" \
        "rmf" "Usuwanie pliku" \
        "rmd" "Usuwanie katalogu" \
        "mvf" "Przeniesienie pliku" \
        "mvd" "Przeniesienie katalogu" \
        "cpf" "Kopiowanie pliku" \
        "cpd" "Kopiowanie katalogu" \
        "path" "Zapewnienie istnienia ścieżki" \
        "" "Wyjdź" 2>$$opt

    if [ $? -eq 1 ] || [ $? -eq 255 ]; then
      dialog --msgbox "Anulowano"  8 20
      return
    fi
clear
opt=`cat $$opt`
rm $$opt
    case $opt in
      "mkf")
        dialog --clear --inputbox "Podaj nazwę pliku" 10 20 2>$$opt
        if [ $? -eq 1 ] || [ $? -eq 255 ]; then
          dialog --msgbox "Anulowano"  8 20
          return
        fi
        opt=`cat $$opt`
        rm $$opt
        make_file "$opt"
        ;;

      "mkd")
        dialog --clear --inputbox "Podaj nazwę folderu: " 10 20 2>$$opt
        if [ $? -eq 1 ] || [ $? -eq 255 ]; then
          dialog --msgbox "Anulowano"  8 20
          return
        fi
        opt=`cat $$opt`
        rm $$opt
        make_dir "$opt"
          ;;

      "rmf")
        dialog --clear --inputbox "Podaj nazwę pliku " 10 20 2>$$opt
        if [ $? -eq 1 ] || [ $? -eq 255 ]; then
          dialog --msgbox "Anulowano"  8 20
          return
        fi
        opt=`cat $$opt`
        rm $$opt
        remove_file "$opt"
          ;;

      "rmd")
        dialog --clear --inputbox "Podaj nazwę folderu: " 10 20 2>$$opt
        if [ $? -eq 1 ] || [ $? -eq 255 ]; then
          dialog --msgbox "Anulowano"  8 20
          return
        fi
        opt=`cat $$opt`
        rm $$opt
        remove_dir "$opt"
          ;;

      "cpf")
        dialog --clear --inputbox "Podaj nazwę pliku " 10 20 2>$$opt
        if [ $? -eq 1 ] || [ $? -eq 255 ]; then
          dialog --msgbox "Anulowano"  8 20
          return
        fi
        opt=`cat $$opt`
        rm $$opt
        copy_file "$opt"
          ;;

      "cpd")
        dialog --clear --inputbox "Podaj nazwę folderu: " 10 20 2>$$opt
        if [ $? -eq 1 ] || [ $? -eq 255 ]; then
          dialog --msgbox "Anulowano"  8 20
          return
        fi
        opt=`cat $$opt`
        rm $$opt
        copy_dir "$opt"
          ;;

      "mvf")
        dialog --clear --inputbox "Podaj nazwę przenoszonego pliku " 10 20 2>$$opt
        if [ $? -eq 1 ] || [ $? -eq 255 ]; then
          dialog --msgbox "Anulowano"  8 20
          return
        fi
        filename=`cat $$opt`
        rm $$opt
        dialog --clear --inputbox "Podaj nazwę docelowego katalogu " 10 20 2>$$opt
        if [ $? -eq 1 ] || [ $? -eq 255 ]; then
          dialog --msgbox "Anulowano"  8 20
          return
        fi
        targetname=`cat $$opt`
        rm $$opt
        move_file "$filename" "$targetname"
          ;;

      "mvd")
        dialog --clear --inputbox "Podaj nazwę przenoszonego katalogu " 10 20 2>$$opt
        if [ $? -eq 1 ] || [ $? -eq 255 ]; then
          dialog --msgbox "Anulowano"  8 20
          return
        fi
        dirname=`cat $$opt`
        rm $$opt
        dialog --clear --inputbox "Podaj nazwę docelowego katalogu " 10 20 2>$$opt
        if [ $? -eq 1 ] || [ $? -eq 255 ]; then
          dialog --msgbox "Anulowano"  8 20
          return
        fi
        targetname=`cat $$opt`
        rm $$opt
        move_dir "$dirname" "$targetname"
          ;;

      "path")
        dialog --clear --inputbox "Podaj ścieżkę, której istnienie chcesz zapewnić:" 10 20 2>$$opt
        if [ $? -eq 1 ] || [ $? -eq 255 ]; then
          dialog --msgbox "Anulowano"  8 20
          return
        fi
        pathname=`cat $$opt`
        rm $$opt
        make_path "$pathname"
          ;;
  esac
clear
