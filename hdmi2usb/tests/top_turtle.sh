#!/bin/bash

sudo systemctl start dev_setup.service

./one_htmi2usb_board.sh opsis
./one_htmi2usb_board.sh atlys
