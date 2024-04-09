#!/usr/bin/bash

#============================================================================
# Autor:      fussz
# Data:       11 mar 2024
# Polecenie:  Napisz skrypt, który wykonuje nieskończoną pętlę, czynności
#             wewnątrz pętli wykonują się co 1 sekundę (komenda sleep 1),
#             i przed rozpoczęciem pętli identyfikator procesu zapisywany
#             jest do pliku endlessScript.pid.
#             Następnie napisz drugi skrypt, który z pliku endlessScript.pid
#             odczytuje identyfikator procesu wykonującego nieskończoną
#             pętlę i go zabija (polecenie kill).
# Drugi skrypt, który zabija pierwszy.
#============================================================================

kill_pid=`cat endlessScript.pid`
kill "$kill_pid"
