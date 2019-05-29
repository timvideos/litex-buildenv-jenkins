#!/bin/bash

echo relay $OPSIS_RELAY is Opsis
echo relay $ATLYS_RELAY is Atlys
echo relay on = board power off
echo relay off = board power on

relay.sh $OPSIS_RELAY read
relay.sh $ATLYS_RELAY read
