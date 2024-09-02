#!/bin/bash
#
# Script to utilize https://github.com/StevenBlack/hosts
#
# https://github.com/StevenBlack/hosts#location-of-your-hosts-file
# - macOS (until 10.14.x macOS Mojave), iOS, Android, Linux: `/etc/hosts` file.
# - macOS Catalina: `/private/etc/hosts` file.
#
# https://github.com/StevenBlack/hosts#reloading-hosts-file
# Your operating system will cache DNS lookups.
# You can either reboot or run the following commands to manually flush your DNS cache once the new hosts file is in place.
# On MacOS https://github.com/StevenBlack/hosts#macos
# `sudo dscacheutil -flushcache;sudo killall -HUP mDNSResponder`
#
# The Google Chrome browser may require manually cleaning up its DNS Cache on chrome://net-internals/#dns
# page to thereafter see the changes in your hosts file. See: https://superuser.com/questions/723703
#

# create a backup
cp /etc/hosts /etc/hosts.bak

# Download hosts file
curl -s -o /etc/StevenBlackHosts https://raw.githubusercontent.com/StevenBlack/hosts/master/hosts

# unify hosts files (myHosts,myBlackHosts & StevenBlackHosts
{ echo "# Last updated $(date)" ; cat /etc/myHosts ; cat /etc/myBlackHosts ; cat /etc/StevenBlackHosts; } > /etc/hosts;

while IFS= read -r whiteHost; do
    # It must be GNU sed or else it will fail!
    gsed -i "/${whiteHost}/d" /etc/hosts
done < /etc/whitelistHost
