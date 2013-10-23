#!/bin/sh
# Apple tweaks

# Less fat font rendering
defaults -currentHost write -globalDomain AppleFontSmoothing -int 1

# Allow typing things like "fffffffuuuuuuuuuuuu" much more easily...
defaults write -g ApplePressAndHoldEnabled -bool false

# Usable key repeat settings
defaults write -g InitialKeyRepeat -int 25
defaults write -g KeyRepeat -int 5

# Kill the notification center in Mountain Lion
launchctl unload -w /System/Library/LaunchAgents/com.apple.notificationcenterui.plist

# Animation speeds
defaults write com.apple.dock expose-animation-duration -float 0

killall Dock

# Show unsigned time machine volumes
defaults write com.apple.systempreferences TMShowUnsupportedNetworkVolumes 1
