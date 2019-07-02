#!/bin/bash

(cd /home/pi/prebuilt
../HDMI2USB-mode-switch/venv/bin/hdmi2usb-mode-switch -v \
    --by-type atlys \
    --load-fx2-firmware hdmi2usb.hex
)
sleep 3

./one_htmi2usb_board.sh opsis
./one_htmi2usb_board.sh atlys
