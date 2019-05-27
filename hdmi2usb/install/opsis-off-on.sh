#!/bin/bash -x

relay_dev=/dev/relay

# relay 0 is Opsis

printf "\rrelay on 0\r" | tio --output-delay 200 ${relay_dev}
sleep 3
printf "\rrelay off 0\r" | tio --output-delay 200 ${relay_dev}

