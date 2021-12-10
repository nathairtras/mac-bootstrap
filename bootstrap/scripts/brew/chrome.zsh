#!/usr/bin/env zsh
set -e

# Configure the module
DF_MODULE="google-chrome"
DF_MODULE_NAME="Google Chrome"

# Set the paths
#DF_MODULE_PATH_PROFILE="$DF_PATH_MANAGED_PROFILES/$DF_MODULE.profile"

# Install VSCode
brew install $DF_MODULE;

# Create profile
#echo "Installing $DF_MODULE_NAME Profile";
#echo '' > $DF_MODULE_PATH_PROFILE

#echo "Activating $DF_MODULE_NAME Profile"
#echo "source $DF_MODULE_PATH_PROFILE" >> $DF_PATH_ZPROFILE
#source $DF_MODULE_PATH_PROFILE
