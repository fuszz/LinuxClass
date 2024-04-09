#!/bin/awk -f

#operatry arytmetyczne
BEGIN { a = 50; b = 40; print "(a + b) = ", (a + b) }
BEGIN { a = 50; b = 40; print "(a - b) = ", (a - b) }
BEGIN { a = 50; b = 40; print "(a * b) = ", (a * b) }
BEGIN { a = 50; b = 40; print "(a / b) = ", (a / b) }
BEGIN { a = 50; b = 40; print "(a % b) = ", (a % b) }

#inkremetacje
BEGIN { a = 10; b = ++a; printf "a = %d, b = %d\n", a, b }
BEGIN { a = 10; b = --a; printf "a = %d, b = %d\n", a, b }
BEGIN { a = 10; b = a++; printf "a = %d, b = %d\n", a, b }
BEGIN { a = 10; b = a--; printf "a = %d, b = %d\n", a, b }

#przypisanie do zmiennej
BEGIN { kolor = "niebieski"; print "Mój ulubiony kolor to", kolor }

#skrócona inkrementacja
BEGIN { ile = 10; ile += 10; print "Licznik = ", ile }
BEGIN { ile = 10; ile -= 10; print "Licznik = ", ile }
BEGIN { ile = 10; ile *= 10; print "Licznik = ", ile }
BEGIN { ile = 10; ile /= 10; print "Licznik = ", ile }
BEGIN { ile = 10; ile %= 10; print "Licznik = ", ile }
BEGIN { ile = 10; ile ^= 10; print "Licznik = ", ile }
BEGIN { ile = 10; ile **= 10; print "Licznik = ", ile }

#operatory realcji
BEGIN { a = 10; b = 10; if (a == b) print "a == b" }
BEGIN { a = 10; b = 20; if (a != b) print "a != b" }
BEGIN { a = 10; b = 20; if (a < b) print "a < b" }
BEGIN { a = 10; b = 10; if (a <= b) print "a <= b" }
BEGIN { a = 20; b = 10; if (a > b) print "a > b" }
BEGIN { a = 10; b = 10; if (a >= b) print "a >= b" }
