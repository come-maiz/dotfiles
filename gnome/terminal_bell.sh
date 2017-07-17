#!/bin/bash
#
# Disable the audible bell and enable the visual one.

gsettings set org.gnome.desktop.wm.preferences audible-bell false
gsettings set org.gnome.desktop.wm.preferences visual-bell true
gsettings set org.gnome.desktop.wm.preferences visual-bell-type fullscreen-flash
