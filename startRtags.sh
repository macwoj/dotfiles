#! /bin/bash

case "$(pidof rdm | wc -w)" in

0)  echo "Restarting Amadeus:     $(date)" >> /var/log/amadeus.txt
    rdm &
    ;;
1)  # all ok
    ;;
*)  echo "Removed double Amadeus: $(date)" >> /var/log/amadeus.txt
    kill $(pidof rdm | awk '{print $1}')
    ;;
esac
