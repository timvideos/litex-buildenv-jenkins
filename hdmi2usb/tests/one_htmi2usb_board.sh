#!/bin/bash -ex

# ./one_htmi2usb_board.sh /dev/hdmi2usb/by-num/all0/tty /dev/hdmi2usb/by-num/all0/video
# ./one_htmi2usb_board.sh /dev/ttyVIZ0 /dev/video1

tty=$1
video=$2

cd /home/pi/HDMI2USB-litex-firmware/jenkins/tests

venv/bin/python ck_tty.py --tty $tty
venv/bin/python ck_video.py --video $video
venv/bin/python ck_version.py --tty $tty
venv/bin/python ck_jpg.py --video $video

diff \
    <(v4l2-compliance --device $video) \
    ../datas/v4l2-compliance.txt

diff <(v4l2-ctl --all) ../datas/v4l2-ctl.txt
