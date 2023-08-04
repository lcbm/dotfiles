#!/bin/bash

function run {
  if ! pgrep $1 ;
  then
    $@&
  fi
}

# run "xrandr --output HDMI1 --mode 25560x1440 --rate 144.0 --primary
run "nm-applet"
