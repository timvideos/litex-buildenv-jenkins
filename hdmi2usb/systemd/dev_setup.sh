#!/bin/bash -x

date>>/home/pi/dev_setup.log
PATH=/sbin:/bin:/usr/bin:/home/pi/bin
# PATH=/home/pi/bin:$PATH

export OPSIS_RELAY=0
export ATLYS_RELAY=2

opsis-off.sh
atlys-off.sh
sleep 3

opsis-on.sh
sleep 3

atlys-on.sh
sleep 3

(cd /home/pi/prebuilt
../HDMI2USB-mode-switch/venv/bin/hdmi2usb-mode-switch -v \
    --by-type atlys \
    --load-fx2-firmware hdmi2usb.hex
)
sleep 3
ln -sf /dev/video0 /dev/hdmi2usb/by-num/opsis0/video

ln -sf /dev/ttyVIZ0 /dev/hdmi2usb/by-num/atlys0/tty
ln -sf /dev/video2 /dev/hdmi2usb/by-num/atlys0/video

