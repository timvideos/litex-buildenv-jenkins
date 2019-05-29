#!/bin/bash -ex

board=$1

tty=/dev/hdmi2usb/by-num/${board}0/tty
video=/dev/hdmi2usb/by-num/${board}0/video

venv/bin/python ck_tty.py --tty $tty
venv/bin/python ck_video.py --video $video
venv/bin/python ck_version.py --tty $tty
venv/bin/python ck_jpg.py --video $video

diff <(v4l2-compliance --device $video) datas/v4l2-compliance.${board}.txt

diff <(v4l2-ctl --all --device $video) datas/v4l2-ctl.${board}.txt
