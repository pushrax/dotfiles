#!/bin/sh
# Apple tweaks

# Kill the notification center in Mountain Lion
launchctl unload -w /System/Library/LaunchAgents/com.apple.notificationcenterui.plist

# Less fat font rendering
defaults -currentHost write -globalDomain AppleFontSmoothing -int 1

