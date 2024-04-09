#!/usr/bin/bash
#============================================================================
# Autor:      fussz
# Data:       11 mar 2024
# Polecenie:  Wykorzystując strumienie zapisz do pliku informacje o procesorze,
#             jądrze, nazwę aktualnie zalogowanego użytkownika oraz katalog
#             domowy użytkownika.
#============================================================================


if [ -f "skrypt2-out.txt" ]; then
  rm -f "skrypt2-out.txt"
fi

echo "1. Informacje o procesorze: ">"skrypt2-out.txt"
cat /proc/cpuinfo>>"skrypt2-out.txt"
echo >>"skrypt2-out.txt"
echo "2. Informacje o jądrze systemu: " >>"skrypt2-out.txt"
cat /proc/version>>"skrypt2-out.txt"
echo >>"skrypt2-out.txt"
echo "3. Nazwa aktualnie zalogowanego użytkownika: " >>"skrypt2-out.txt"
whoami>>"skrypt2-out.txt"
echo >>"skrypt2-out.txt"
echo "4. Katalog domowy użytkownika " >>"skrypt2-out.txt"
ls -alt ~ >>"skrypt2-out.txt"
