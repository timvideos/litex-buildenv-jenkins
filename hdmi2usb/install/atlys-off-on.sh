#!/bin/bash -x

relay_dev=/dev/relay

# relay 2 is Atlys

printf "\rrelay on 2\r" | tio --output-delay 200 ${relay_dev}
sleep 3
printf "\rrelay off 2\r" | tio --output-delay 200 ${relay_dev}

