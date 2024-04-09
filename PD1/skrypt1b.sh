#!/usr/bin/bash

#=========================================================================
# Autor:      fussz
# Data:       12 mar 2024
# Polecenie:  Napisz skrypt, który pozwala użytkownikowi
#             utworzyć, usunąć, skopiować, przenieść plik/folder
#             oraz utworzyć foldery podane w ścieżce. (Wersja z menu)
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
    read -ep "Czy na pewno chcesz usunąć plik "$1"? [T/n]: "
    if [ "$REPLY" = 'T' ]; then
      rm $1
    echo "Usunięto plik "$1". "
    else
      echo "Anulowano usuwanie pliku $1"
    fi
  else
    echo "Nie istnieje plik o nazwie $1"
  fi
}

function remove_dir(){ # Usuwa katalog o nazwie $1, o ile istnieje
 if [ -d $1 ]; then
    read -ep "Czy na pewno chcesz usunąć katalog "$1" z zawartością? [T/n]: "
    if [ "$REPLY" = 'T' ]; then
      rm -rdf $1
    echo "Usunięto katalog "$1". "
    else
      echo "Anulowano usuwanie katalogu $1"
    fi
  else
    echo "Nie istnieje katalog o nazwie $1"
  fi
}

function copy_file(){ # kopiuje plik $1
  if [ -f "$1" ]; then
    cp $1 "kopia_""$1"
  else
    echo ""$1": Nie ma takiego pliku"
  fi
}

function copy_dir(){ # kopiuje zawartość katalogu $1 do katalogu kopia_$1
  if [ -d "$1" ]; then
    echo "Kopiowanie katalogu "$1""
    cp -r "$1" "kopia-""$1"
  else
    echo ""$1": Nie ma takiego katalogu"
  fi
}


function move_file(){ # przenosi plik $1 do katalogu $2
  if [ -f "$1" ] && [ -d "$2" ]; then
    echo "Przeniesienie pliku "$1" do katalogu $2"
    mv "$1" "$2"
  else
    echo "Podany plik lub katalog nie istnieje!"
  fi
}

function move_dir(){
  if [ -d "$1" ] && [ -d "$2" ]; then
    echo "Przeniesienie katalogu "$1" do katalogu $2"
    mv -ft "$2" "$1"
  else
    echo "Przynajmniej jeden z podanych katalogów nie istnieje!"
  fi
}

function make_path(){ # Tworzy foldery tak, by ścieżka $1 istniała
  mkdir -p "$1"
}

function error_info(){
  echo "Wybrano niewłaściwą funkcję"
}

select check in make_file make_dir remove_file remove_dir copy_file copy_dir move_file move_dir make_path exit
  do
    case $check in
      make_file)
        read -p "Podaj nazwę tworzonego pliku: " filename
        make_file "$filename"
          ;;
      make_dir)
        read -p "Podaj nazwę tworzonego katalogu: " dirname
        make_dir "$dirname"
          ;;
      remove_file)
        read -p "Podaj nazwę usuwanego pliku: " filename
        remove_file "$filename"
          ;;
      remove_dir)
        read -p "Podaj nazwę usuwanego katalogu: " dirname
        remove_dir "$dirname"
          ;;
      copy_file)
        read -p "Podaj nazwę kopiowanego pliku: " filename
        copy_file "$filename"
          ;;
      copy_dir)
        read -p "Podaj nazwę kopiowanego katalogu: " dirname
        copy_dir "$dirname"
          ;;
      move_file)
        read -p "Podaj nazwę przenoszonego pliku: " filename
        read -p "Podaj katalog, do którego przenosisz plik: " targetname
        move_file "$filename" "$targetname"
          ;;
      move_dir)
        read -p "Podaj nazwę przenoszonego katalogu: " dirname
        read -p "Podaj katalog, do którego przenosisz katalog " targetname
        move_dir "$dirname" "$targetname"
          ;;
      make_path)
        read -p "Podaj ścieżkę, której istnienie chcesz zapewnić: " pathname
        make_path "$pathname"
          ;;
      exit)
        echo "Opuszczam skrypt"
        exit 0
          ;;
      *)
        error_info
  esac
done
