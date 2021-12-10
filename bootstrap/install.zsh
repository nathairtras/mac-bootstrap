#!/usr/bin/env zsh
# Start of Script
BASE_DIR=${0:a:h}
SCRIPT_DIR=$BASE_DIR/scripts

# Load the environment
. $BASE_DIR/env.sh

# Base Configuration
source $SCRIPT_DIR/base.zsh
source $HOME/.zprofile

# Homebrew
source $SCRIPT_DIR/brew/install.zsh
source $HOME/.zprofile

# Homebrew: VSCode
source $SCRIPT_DIR/brew/vscode.zsh
source $HOME/.zprofile

# Homebrew: direnv
source $SCRIPT_DIR/brew/direnv.zsh
source $HOME/.zprofile

# Homebrew: Python
source $SCRIPT_DIR/brew/python.zsh
source $HOME/.zprofile

# Homebrew: Google Chrome
source $SCRIPT_DIR/brew/chrome.zsh

# MacOS Configuration - Done last as it might have dependencies on software!
source $SCRIPT_DIR/system-preferences/main.zsh
