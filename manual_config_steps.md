### Manual post tasks

- System Preferences -> Touch ID (set Apple ID finger print)
- System Preferences -> Desktop & Screen saver -> Screen saver -> Hot Corners
- System Preferences -> Dock : (size,automatically hide and show the dock)
- iTerm2 -> Preferences -> Load preferences from a custom folder or URL
- add wroskspaces in Slack
  ** spotinst.slack.com
  ** kubernetes.slack.com
  ** istio.slack.com
  ** rancher-users.slack.com
  ** confluentcommunity.slack.com
  ** datadoghq.slack.com
- 2F auth
  ** use "g" number
  ** enable master password
- setup DasKeyboard (https://www.youtube.com/watch?v=St2jUxnCVKI)

```
Go to System Preferences > Security & Privacy and give Full Disk Access to Alacritty.
```

# Manual Config Steps

Steps that I haven't automate yet or there are not possible to be automated and are currently performed manually.

### Misc

```
open /Applications/Maccy.app
#Preferences -> Launch at login
```

```
open /Applications/Dozer.app
#Preferences -> Launch at login
```

### Track Pad

Trackpad 3 fingers drag
You can drag with 3 fingers instead of click and dragging on the trackpad. Turn on this gesture, your fingers will thank you!
You can find it in:

```
Preferences > Accessibility > Pointer Control -> Mouse & Trackpad > Trackpad Options... > Enable dragging > three finger drag
```

### Enable MacOS TouchID when running `sudo` (NOT WORKING?)

add the bellow in the second line of file `/private/etc/pam.d/sudo`

```
# sudo: auth account password session
auth       sufficient     pam_tid.so
```

### configure multi-display resolutions and arrangements

```
https://github.com/jakehilborn/displayplacer
```

### Keybase

Settings
Files
Enable Keybase in Finder
Advanced
uncheck -> Always stay logged in

### Cryptomator

TBD

### Misc

open:

- Caffeine (keep active)
- Dozer (organize/hide menus)
- Bitbar

### 1paqssword

https://developer.1password.com/docs/cli/get-started#turn-on-biometric-unlock

Turn on biometric unlock

- Open 1Password.
- Click the account or collection at the top of the sidebar and choose Preferences > Security.
- Select Touch ID.
- Click Developer in the sidebar.
- Select Biometric Unlock for 1Password CLI.

### Telegram

Link devices, 2 profiles
"GR"
"US"

### Set Up HTTPS by Default in Your Browser

brave://settings/security?search=privacy

- Toggle “Always use secure connections”

brave://settings/security?search=security

- Toggle "Use secure DNS"
- Select With Custom and choose Cloudflare (1.1.1.1) as a service provider from the drop-down menu

### Uninstall Walkme

find "string id"

```
global ❯ find $HOME/Library/Application\ Support/Google -depth -path '*walkme*'

/Users/${USER}/Library/Application Support/Google/Chrome/Profile 2/Extensions/fckonodhlfjlkndmedanenhgdnbopbmh
```

remove using the "string id"

```
global ❯ find $HOME/Library/Application\ Support/Google -depth -path '*fckonodhlfjlkndmedanenhgdnbopbmh*' -delete
```
