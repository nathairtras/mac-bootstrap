#!/usr/bin/env zsh
# Menubar Icons
echo "Configuring Menubar"
defaults write com.apple.controlcenter "NSStatusItem Visible Bluetooth" -bool $DF_SP_MENU_BLUETOOTH;

# Menubar Clock
echo "Configuring Clock"
defaults write com.apple.menuextra.clock DateFormat "$DF_SP_APPEARANCE_DATE_FORMAT"
defaults write com.apple.menuextra.clock ShowSeconds -bool $DF_SP_APPEARANCE_SHOW_SECONDS
defaults write com.apple.menuextra.clock Show24Hour -bool $DF_SP_APPEARANCE_SHOW_24_HOUR
