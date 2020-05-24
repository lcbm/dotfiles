#!/bin/bash

function run {
  if ! pgrep $1 ;
  then
    $@&
  fi
}
# run "xrandr --output HDMI1 --mode 25560x1440 --rate 144.0 --primary
run "nm-applet"
#run "caffeine"
run "pamac-tray"
run "xfce4-power-manager"
run "blueberry-tray"
run "/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1"
run "numlockx on"
run "volumeicon"
run "nitrogen --restore"
run "xfce4-clipman"
