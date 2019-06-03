#!/bin/bash -x

opsis-off.sh
atlys-off.sh

sleep 3
opsis-on.sh
sleep 3

atlys-on.sh
sleep 3

(cd ~/prebuilt
~/HDMI2USB-mode-switch/venv/bin/hdmi2usb-mode-switch -v \
    --by-type atlys \
    --load-fx2-firmware hdmi2usb.hex
)

sleep 3
sudo ln -sf /dev/video0 /dev/hdmi2usb/by-num/opsis0/video

sudo ln -sf /dev/ttyVIZ0 /dev/hdmi2usb/by-num/atlys0/tty
sudo ln -sf /dev/video2 /dev/hdmi2usb/by-num/atlys0/video

./top_turtle.sh
