#!/bin/bash

has_external_monitor=$(xrandr | grep "LVDS")

if [ -n "$has_external_monitor" ]; then
  xrandr --output VGA-1 --primary --left-of LVDS-1
fi
