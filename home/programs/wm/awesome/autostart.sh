#!/usr/bin/env sh

run() {
  if ! pgrep -f "$1" ;
  then
    "$@"&
  fi
}

run picom