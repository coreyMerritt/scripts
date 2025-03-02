#!/bin/bash

pkm="$(command -v apt || command -v dnf || command -v yum || command -v pacman || command -v zypper || command -v apk || command -v brew)"

# Ensure the user is not root, no DBUS session for root user.
if [[ "$USER" == "root" ]]; then
  echo "This can only be run as a non-root user."
  exit 1
fi


# Install Gnome settings if its not already present
GNOME_SETTINGS_INSTALLED="$($pkm list installed gnome-settings-daemon | grep gnome-settings)"
if [[ "$GNOME_SETTINGS_INSTALLED" ]]; then
  echo "Nothing needs to happen" > /dev/null
else
  echo "installing gnome-settings-daemon"
  sudo $pkm install -y gnome-settings-daemon
fi


# Adjust user's repeat rate as requested
if [[ "$1" == "up" ]]; then
  gsettings set org.gnome.desktop.peripherals.keyboard repeat-interval 15
  gsettings set org.gnome.desktop.peripherals.keyboard delay 120
elif [[ "$1" == "down" ]]; then
  gsettings set org.gnome.desktop.peripherals.keyboard repeat-interval 30
  gsettings set org.gnome.desktop.peripherals.keyboard delay 200
else
  echo "Invalid parameter."
  rr -h
fi

