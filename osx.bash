#!/bin/bash
# Apple tweaks

# Usable key repeat settings
defaults write NSGlobalDomain InitialKeyRepeat -int 15
defaults write NSGlobalDomain KeyRepeat -int 3

# Allow typing things like "fffffffuuuuuuuuuuuu" much more easily...
defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false

# Turn off elastic scrolling
defaults write NSGlobalDomain NSScrollViewRubberbanding -int 0

# Don't save to iCloud by default
defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool false

# Kill the notification center in Mountain Lion
launchctl unload -w /System/Library/LaunchAgents/com.apple.notificationcenterui.plist

# Very fast animations
defaults write com.apple.dock autohide-delay -float 0
defaults write com.apple.dock autohide-time-modifier -float 0.6
defaults write com.apple.dock expose-animation-duration -float 0
defaults write NSGlobalDomain NSWindowResizeTime -float 0.2
defaults write NSGlobalDomain NSToolbarFullScreenAnimationDuration -float 0.2

# Show unsigned time machine volumes
defaults write com.apple.systempreferences TMShowUnsupportedNetworkVolumes 1

killall Dock

# Disable boot sound
sudo nvram SystemAudioVolume=" "

# Turn on tap-to-click globally
defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
