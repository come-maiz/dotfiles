#!/bin/bash
#
# Install configuration files.
#
# Arguments:
# machine: The type of machine to be installed. Either devel or comms.

machine="$1"

dir="$(dirname $0)"

# editors
ln -s "${dir}/editors/emacs/.emacs.d" "${HOME}/.emacs.d"


if [ "${machine}" == 'comms' ]; then
    # email
    ln -s "${dir}/email/offlineimap/.offlineimaprc" "${HOME}/.offlineimaprc"
    ln -s "${dir}/email/msmtp/.msmtprc" "${HOME}/.msmtprc"
    # mutt
    ln -s "${dir}/email/mutt/.muttrc" "${HOME}/.muttrc"
    mkdir -p "$HOME/.mutt/accounts"
    ln -s "${dir}/email/mutt/accounts/personal" "${HOME}/.mutt/accounts/personal"
    ln -s "${dir}/email/mutt/accounts/canonical" "${HOME}/.mutt/accounts/canonical"
    ln -s "${dir}/email/.mailcap" "${HOME}/.mailcap"
    # weechat
    mkdir -p "${HOME}/.weechat"
    ln -s "${dir}/chat/weechat/irc.conf" "${HOME}/.weechat/irc.conf"
elif [ "${machine}" == 'devel' ]; then
    # git
    ln -s "${dir}/source_control/git/.gitconfig" "${HOME}/.gitconfig"
fi

# bash
cat "${dir}/shell/bash/.bashrc" >> "${HOME}/.bashrc"
