#!/usr/bin/env zsh
set -e

# Configure the module
DF_MODULE="direnv"
DF_MODULE_NAME="direnv"

# Set the paths
DF_MODULE_PATH_PROFILE="$DF_PATH_MANAGED_PROFILES/$DF_MODULE.profile"

# Install
brew install direnv;

# Create profile
echo "Installing $DF_MODULE_NAME Profile";
echo 'eval "$(direnv hook zsh)"' > $DF_MODULE_PATH_PROFILE

echo "Activating $DF_MODULE_NAME Profile"
echo "source $DF_MODULE_PATH_PROFILE" >> $DF_PATH_ZPROFILE
source $DF_MODULE_PATH_PROFILE
