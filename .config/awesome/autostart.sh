#!/bin/bash

function run {
  if ! pgrep $1 ;
  then
    $@&
  fi
}

run "nm-applet"
run "picom -b --config $HOME/.config/picom/picom.conf"
