#!/usr/bin/env zsh
DF_LOG_PREFIX="$DF_MODULE_LOG_PREFIX: General"

# Interface Style
case "$DF_AD_APPLE_INTERFACE_STYLE" in
  "Dark")
    defaults delete .GlobalPreferences AppleInterfaceStyleSwitchesAutomatically > /dev/null 2>&1
    defaults write .GlobalPreferences AppleInterfaceStyle -string "Dark"
    echo "$DF_LOG_PREFIX: Dark/Light Mode | $DF_AD_APPLE_INTERFACE_STYLE"
    ;;
  "Light")
    defaults delete .GlobalPreferences AppleInterfaceStyleSwitchesAutomatically > /dev/null 2>&1
    defaults delete .GlobalPreferences AppleInterfaceStyle
    echo "$DF_LOG_PREFIX: Dark/Light Mode | $DF_AD_APPLE_INTERFACE_STYLE"

    ;;
  "Auto")
    defaults delete .GlobalPreferences AppleInterfaceStyle
    defaults write .GlobalPreferences AppleInterfaceStyleSwitchesAutomatically -bool true;
    echo "$DF_LOG_PREFIX: Dark/Light Mode | $DF_AD_APPLE_INTERFACE_STYLE"
    ;;
  *)
    echo "$DF_LOG_PREFIX: Dark/Light Mode | WARNING: Invalid Option!"
    ;;
esac

# Accent and Highlight Colors
echo "$DF_LOG_PREFIX: Accent/Highlight Colors"
case "$DF_AD_APPLE_ACCENT_COLOR_NAME" in
    "Multicolor")
        DF_AD_APPLE_AQUA_COLOR_VARIANT=1;
        ;;
    "Blue")
        DF_AD_APPLE_AQUA_COLOR_VARIANT=1;
        DF_AD_APPLE_ACCENT_COLOR=4;
        ;;
    "Purple")
        DF_AD_APPLE_AQUA_COLOR_VARIANT=1;
        DF_AD_APPLE_ACCENT_COLOR=5;
        ;;
    "Pink")
        DF_AD_APPLE_AQUA_COLOR_VARIANT=1;
        DF_AD_APPLE_ACCENT_COLOR=6;
        ;;
    "Red")
        DF_AD_APPLE_AQUA_COLOR_VARIANT=1;
        DF_AD_APPLE_ACCENT_COLOR=0;
        ;;
    "Orange")
        DF_AD_APPLE_AQUA_COLOR_VARIANT=1;
        DF_AD_APPLE_ACCENT_COLOR=1;
        ;;
    "Yellow")
        DF_AD_APPLE_AQUA_COLOR_VARIANT=1;
        DF_AD_APPLE_ACCENT_COLOR=2;
        ;;
    "Green")
        DF_AD_APPLE_AQUA_COLOR_VARIANT=1;
        DF_AD_APPLE_ACCENT_COLOR=3;
        ;;
    "Graphite")
        DF_AD_APPLE_AQUA_COLOR_VARIANT=6;
        DF_AD_APPLE_ACCENT_COLOR=-1;
        ;;
    *)
        DF_AD_APPLE_AQUA_COLOR_VARIANT=6;
        DF_AD_APPLE_ACCENT_COLOR=-1;
        ;;
esac;
if [[ $DF_AD_APPLE_ACCENT_COLOR_NAME == "Multicolor" ]]; then
    set +e
    defaults delete .GlobalPreferences AppleAccentColor > /dev/null 2>&1
    defaults delete .GlobalPreferences AppleHighlightColor > /dev/null 2>&1;
    set -e
    defaults write .GlobalPreferences AppleAquaColorVariant $DF_AD_APPLE_AQUA_COLOR_VARIANT;
else
    defaults write .GlobalPreferences AppleAquaColorVariant $DF_AD_APPLE_AQUA_COLOR_VARIANT;
    defaults write .GlobalPreferences AppleAccentColor $DF_AD_APPLE_ACCENT_COLOR;
fi

if [[ "$DF_AD_APPLE_HIGHLIGHT_COLOR" != "Multicolor" ]]; then
    # There is probably a way to look this up...
    case "$DF_AD_APPLE_HIGHLIGHT_COLOR" in
        "Blue")
            DF_AD_APPLE_HIGHLIGHT_COLOR_VALUE="0.698039 0.843137 1.000000"
            ;;
        "Purple")
            DF_AD_APPLE_HIGHLIGHT_COLOR_VALUE="0.968627 0.831373 1.000000"
            ;;
        "Pink")
            DF_AD_APPLE_HIGHLIGHT_COLOR_VALUE="1.000000 0.749020 0.823529"
            ;;
        "Red")
            DF_AD_APPLE_HIGHLIGHT_COLOR_VALUE="1.000000 0.733333 0.721569"
            ;;
        "Orange")
            DF_AD_APPLE_HIGHLIGHT_COLOR_VALUE="1.000000 0.874510 0.701961"
            ;;
        "Yellow")
            DF_AD_APPLE_HIGHLIGHT_COLOR_VALUE="1.000000 0.937255 0.690196"
            ;;
        "Green")
            DF_AD_APPLE_HIGHLIGHT_COLOR_VALUE="0.752941 0.964706 0.678431"
            ;;
        "Graphite")
            DF_AD_APPLE_HIGHLIGHT_COLOR_VALUE="0.847059 0.847059 0.862745"
            ;;
        *)
            DF_AD_APPLE_HIGHLIGHT_COLOR_VALUE="$DF_AD_APPLE_HIGHLIGHT_COLOR"
            ;;
    esac
    defaults write .GlobalPreferences AppleHighlightColor "$DF_AD_APPLE_HIGHLIGHT_COLOR_VALUE"
fi

echo "$DF_LOG_PREFIX: Sidebar Icon Size"
defaults write .GlobalPreferences NSTableViewDefaultSizeMode $DF_AD_NS_TABLE_VIEW_DEFAULT_SIZE_MODE

echo "$DF_LOG_PREFIX: Wallpaper Tinting"
defaults write .GlobalPreferences AppleReduceDesktopTinting -bool $DF_AD_APPLE_REDUCE_DESKTOP_TINTING

echo "$DF_LOG_PREFIX: Scrollbar Display"
defaults write .GlobalPreferences AppleShowScrollBars -string $DF_AD_APPLE_SHOW_SCROLL_BARS

echo "$DF_LOG_PREFIX: Scrolling Behavior"
defaults write .GlobalPreferences AppleScrollerPagingBehavior -bool $DF_AD_APPLE_SCROLLER_PAGING_BEHAVIOR

echo "$DF_LOG_PREFIX: Prefer Tabs"
defaults write .GlobalPreferences AppleWindowTabbingMode -string $DF_AD_APPLE_WINDOW_TABBING_MODE

echo "$DF_LOG_PREFIX: Ask On Changes"
defaults write .GlobalPreferences NSCloseAlwaysConfirmsChanges -bool $DF_AD_NS_CLOSE_ALWAYS_CONFIRMS_CHANGES

echo "$DF_LOG_PREFIX: Quit Keeps Windows"
defaults write .GlobalPreferences NSQuitAlwaysKeepsWindows -bool $DF_AD_NS_QUIT_ALWAYS_KEEPS_WINDOWS

echo "$DF_LOG_PREFIX: Set Recent Items Counts"
COMMAND='tell application "System Events" to tell appearance preferences to set recent applications limit to '$DF_AD_OSA_RECENT_APPLICATIONS_LIMIT
osascript -e "$COMMAND"

COMMAND='tell application "System Events" to tell appearance preferences to set recent documents limit to '$DF_AD_OSA_RECENT_DOCUMENTS_LIMIT
osascript -e "$COMMAND"

COMMAND='tell application "System Events" to tell appearance preferences to set recent servers limit to '$DF_AD_OSA_RECENT_SERVERS_LIMIT
osascript -e "$COMMAND"
