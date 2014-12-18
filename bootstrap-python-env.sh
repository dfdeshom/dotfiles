#!/bin/bash
############################
# Bootstrap python and pip
############################

# Get pip
wget https://bootstrap.pypa.io/get-pip.py

# install pip in user dir
python get-pip.py --user

# install virtualenv, pylint, autopep8 as user
pip install --user virtualenvwrapper pylint autopep8
