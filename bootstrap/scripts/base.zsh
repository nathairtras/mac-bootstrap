#!/usr/bin/env zsh
set -e

# Constants
ZPROFILE_PATH=$HOME/.zprofile
DF_PATH=$HOME/.dotfiles
DF_PATH_ZPROFILE=$DF_PATH/zprofile
DF_PATH_MANAGED=$DF_PATH/managed
DF_PATH_MANAGED_PROFILES=$DF_PATH_MANAGED/profiles
DF_PATH_MANAGED_FUNCTIONS=$DF_PATH_MANAGED/functions

# Ensure Directories
echo "Preparing Dotfiles Directory"
mkdir -p $DF_PATH
echo "Preparing Managed Dotfiles Directory"
mkdir -p $DF_PATH_MANAGED
echo "Preparing Profiles Directory"
mkdir -p $DF_PATH_MANAGED_PROFILES
echo "Preparing Functions Directory"
mkdir -p $DF_PATH_MANAGED_FUNCTIONS
echo "Writing Base ZSH Profile"
echo '# ZSH Profile (Managed)

# Base Environment
export DF_ARCH=`uname -m`
export DF_PATH=$HOME/.dotfiles
export DF_PATH_ZPROFILE=$DF_PATH/zprofile
export DF_PATH_MANAGED=$DF_PATH/managed
export DF_PATH_MANAGED_PROFILES=$DF_PATH_MANAGED/profiles
export DF_PATH_MANAGED_FUNCTIONS=$DF_PATH_MANAGED/functions
' > $DF_PATH_ZPROFILE

echo "Linking Base ZSH Profile"
rm -rf $ZPROFILE_PATH
ln -s $DF_PATH_ZPROFILE $ZPROFILE_PATH

echo "Loading Base ZSH Profile"
source $ZPROFILE_PATH
