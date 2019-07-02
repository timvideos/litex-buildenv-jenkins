#!/bin/bash -x

num=$1
state=$2

printf "\rrelay $state $num\r" | cstream -b 1 -t 50 | tee /dev/ttyrelay

