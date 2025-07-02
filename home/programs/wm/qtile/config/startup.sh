#!/usr/bin/env bash

picom --backend glx &
nitrogen --restore &

source $HOME/.config/polybar/launch.sh
