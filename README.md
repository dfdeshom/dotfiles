dotfiles
========
Manage and re-create my development environment. 

Installing
===========
To install the dotfiles, run `makesymlinks.sh`. This should also
install the hidden directories.

Setting up python environment
==============================

To bootstrap pip/python, run `bootstrap-python-env.sh`. This will
download the latest version of `pip` and install a few essential packages.

Bootstrapping emacs
====================
On first startup and upon reading `.emacs.d/`, `emacs` will download
install, and configure the different packages in `.emacs.d/lisp/init-packages.el`

Other files
==============
I am using the thinkpad t440p and I've had to make some additional
changes, most of them in the `/etc/` directory. Those files are in the
`t440p` directory
