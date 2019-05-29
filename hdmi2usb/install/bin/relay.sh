#!/bin/bash -x

num=$1
state=$2

relay_dev=/dev/ttyrelay

# the \c allows board to dipplay on/off before tio errors from no input

printf "\r\rrelay $state $num\r\c\c\c\c" | tio --output-delay 50 ${relay_dev}

