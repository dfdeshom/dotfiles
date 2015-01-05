#!/bin/bash
############################
# Bootstrap python and pip
############################

if [ ! -f ~/.local/bin/pip ]; then
    # Get pip
    wget https://bootstrap.pypa.io/get-pip.py

    # install pip in user dir
    python get-pip.py --user
fi

# install base python packages we need
pip install --user virtualenvwrapper pylint autopep8 pyflakes ipython Fabric
