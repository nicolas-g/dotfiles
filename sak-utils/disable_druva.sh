#!/bin/bash
set +x
user=`ls -l /dev/console | awk '//{print $3}'`
U='/tmp/inSync_client_uninstallation.log'
echo "loggedInUser:" $user  >> $U 2>&1

echo "Stopping inSync Client." >> $U

killall inSync

killall inSyncDecommission

echo "Cleaning up inSync Application from the machine" >> $U

launchctl unload /Library/LaunchDaemons/inSyncDecommission.plist

rm -f /Library/LaunchDaemons/inSyncDecommission.plist

sleep 3

launchctl unload /Library/LaunchAgents/inSyncAgent.plist
rm -f /Library/LaunchAgents/inSyncAgent.plist

sleep 3

echo "Cleaning up Keychain entries" >>$U

/Applications/Druva\ inSync.app/Contents/MacOS/inSyncDecommission RemoveKeychainItems

sleep 5

echo "Cleaning up package" >>$U

mv /Applications/Druva\ inSync /Applications/Druva\ inSync_old

sleep 5

echo "Cleaning up local Directories" >>$U

mv /Users/$user/Library/Application\ Support/inSync /Users/$user/Library/Application\ Support/inSync_old

exit
