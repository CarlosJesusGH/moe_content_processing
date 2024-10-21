#!/bin/bash
"""
@report
This script is used to setup the virtual environment and install the required packages
Usage: ./init_setup.sh [reset]
If the parameter "reset" is passed, then the virtual environment will be removed and a new one will be created
"""

# make init_setup.sh executable
# chmod +x init_setup.sh

# Check if parameter is passed. if parameter is equal to "reset", then remove the virtual environment and continue with the setup
if [ "$1" == "reset" ]; then
    echo "Removing the virtual environment"
    rm -rf venv
fi

# Create a new virtual environment
python -m venv venv

# Activate the virtual environment
source venv/bin/activate

# Install the required packages
pip install -r requirements.txt