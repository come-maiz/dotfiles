#!/bin/bash

dir="$(dirname $0)"

# email
ln -s "$dir/email/offlineimap/.offlineimaprc" "$HOME/.offlineimaprc"
ln -s "$dir/email/msmtp/.msmtprc" "$HOME/.msmtprc"
