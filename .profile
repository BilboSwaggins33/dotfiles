# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi
. "$HOME/.cargo/env"


PATH="$PATH:/usr/local/texlive/2024/bin/x86_64-linux"
PATH="$PATH:/home/aaron/ch-linux-amd64"
PATH="$PATH:/opt/idea-IU-243.22562.218/bin"
PATH="$PATH:/opt/PhpStorm-243.22562.233/bin"
PATH="$PATH:$HOME/.cargo/bin"
PATH="$PATH:/opt/cisco/anyconnect/bin"
