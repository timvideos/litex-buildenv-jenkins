#!/bin/bash -ex

board=$1

tty=/dev/hdmi2usb/by-num/${board}0/tty
video=/dev/hdmi2usb/by-num/${board}0/video

venv/bin/python ck_tty.py --tty $tty
venv/bin/python ck_video.py --video $video
venv/bin/python ck_version.py --tty $tty
venv/bin/python ck_jpg.py --video $video
venv/bin/python ck_jpg2.py --tty $tty --video $video --board ${board}

# these may show shomething interesting, but have false errors
diff <(v4l2-compliance --device $video) \
    datas/v4l2-compliance.${board}.txt || true

diff <(v4l2-ctl --all --device $video) \
    datas/v4l2-ctl.${board}.txt || true
