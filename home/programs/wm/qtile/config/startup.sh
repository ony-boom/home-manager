#!/usr/bin/env bash

picom --backend glx &
nm-applet &
nitrogen --restore &

source $HOME/.config/polybar/launch.sh
