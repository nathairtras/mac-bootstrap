#!/usr/bin/env zsh
set -e

# Configure the module
DF_MODULE="python$DF_PYTHON_VERSION"
DF_MODULE_NAME="Python$DF_PYTHON_VERSION"
DF_MODULE_BREW_NAME="python@$DF_PYTHON_VERSION"

# Set the paths
DF_MODULE_PATH_PROFILE="$DF_PATH_MANAGED_PROFILES/$DF_MODULE.profile"

# Install
brew install $DF_MODULE_BREW_NAME;

# Create profile
echo "Installing $DF_MODULE_NAME Profile";
echo '# Python3 Path Configuration
export PATH=$HOMEBREW_PREFIX/opt/python\@'$DF_PYTHON_VERSION'/bin:$PATH
'> $DF_MODULE_PATH_PROFILE

echo "Activating $DF_MODULE_NAME Profile"
echo "source $DF_MODULE_PATH_PROFILE" >> $DF_PATH_ZPROFILE
source $DF_MODULE_PATH_PROFILE
