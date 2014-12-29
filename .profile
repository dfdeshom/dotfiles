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

# thinkpad t440p BS 
# make a real right-click buton
# make a real middle-click button
synclient RightButtonAreaLeft=5000
synclient RightButtonAreaRigh=0
synclient RightButtonAreaTop=63
synclient RightButtonAreaBott=0
synclient MiddleButtonAreaLef=3000
synclient MiddleButtonAreaRig=4063
synclient MiddleButtonAreaTop=100
synclient MiddleButtonAreaBot=0
         
# disable touchpad almost everywhere 
synclient AreaBottomEdge=100

