#!/bin/bash

dir="$(dirname $0)"

# email
ln -s "$dir/email/offlineimap/.offlineimaprc" "$HOME/.offlineimaprc"
ln -s "$dir/email/msmtp/.msmtprc" "$HOME/.msmtprc"
# mutt
ln -s "$dir/email/mutt/.muttrc" "$HOME/.muttrc"
mkdir -p "$HOME/.mutt/accounts"
ln -s "$dir/email/mutt/accounts/personal" "$HOME/.mutt/accounts/personal"
ln -s "$dir/email/mutt/accounts/canonical" "$HOME/.mutt/accounts/canonical"
