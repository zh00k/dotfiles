#!/usr/bin/env bash

if eww active-windows | grep -q "calendar_popup"; then
  eww close calendar_popup
else
  if ! pgrep -x eww >/dev/null; then
    LC_TIME=en_GB.UTF-8 eww daemon
    sleep 0.2
  fi
  LC_TIME=en_GB.UTF-8 eww open calendar_popup
fi
