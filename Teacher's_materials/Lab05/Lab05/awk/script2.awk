#!/bin/awk -f

BEGIN { print "Start" }
/.*/ { print $0 } # lub { print $0 }
END {print "Stop" }

BEGIN { ile=0 }
{ ile=ile+1 }
END { print "Razem = " ile }
