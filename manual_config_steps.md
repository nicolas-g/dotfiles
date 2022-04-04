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

Enable Keybase in Finder
TBD

### 1paqssword

https://developer.1password.com/docs/cli/get-started#turn-on-biometric-unlock

Turn on biometric unlock

- Open 1Password.
- Click the account or collection at the top of the sidebar and choose Preferences > Security.
- Select Touch ID.
- Click Developer in the sidebar.
- Select Biometric Unlock for 1Password CLI.

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
