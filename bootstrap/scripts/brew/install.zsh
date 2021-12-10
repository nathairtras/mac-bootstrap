#!/usr/bin/env zsh
set -e

# Configure the module
DF_MODULE="brew"
DF_MODULE_NAME="Brew"

# Set the paths
DF_MODULE_PATH_PROFILE="$DF_PATH_MANAGED_PROFILES/$DF_MODULE.profile"

# Figure out the expected architecture path
if [[ "$DF_ARCH" == 'arm64' ]]; then
  DF_HOMEBREW_PATH="/opt/homebrew";
else
  DF_HOMEBREW_PATH="/usr/local"
fi

DF_HOMEBREW_BIN="$DF_HOMEBREW_PATH/bin/brew"
DF_HOMEBREW_ENV=`$DF_HOMEBREW_BIN shellenv || echo ""`
eval "$DF_HOMEBREW_ENV"

if ( brew -v > /dev/null 2>&1 ); then
  echo "Homebrew already installed";
else
  echo "Homebrew not installed - installing";
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)";
fi

# add homebrew to the path
echo "Installing $DF_MODULE_NAME Profile";
echo 'eval "$('$DF_HOMEBREW_BIN' shellenv)"' > $DF_MODULE_PATH_PROFILE
echo "source $DF_MODULE_PATH_PROFILE" >> $DF_PATH_ZPROFILE
source $DF_MODULE_PATH_PROFILE

# get brew up to date
echo "Updating Homebrew"
brew update;
brew upgrade;
