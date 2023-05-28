### Authy

- use G number
- "1 not one.."
- Settings -> General -> Enable Master Password (so it doesn't open without prompting)

### Bitwarden

- open preferences -> enable PIN / Touch ID

### SSH

```
ssh-keygen -o -a 100 -t ed25519 -f ~/.ssh/id_ed25519_ngpersonal -C "ngpersonal@dmbpm1max"
cat ~/.ssh/id_ed25519_ngpersonal.pub| pbcopy
```

- Upload public key to your Github account

```
open https://github.com/settings/keys
```

### Brave

- Open Brave and configure Sync using the sync code from "password manager"
  or other existing device with Brave

```
open -a "Brave Browser" -u brave://settings/braveSync
```

- click on Sync everything

### Set Up HTTPS by Default in Your Browser

brave://settings/security?search=privacy

- Toggle “Always use secure connections”

brave://settings/security?search=security

- Toggle "Use secure DNS"
- Select With Custom and choose Cloudflare (1.1.1.1) as a service provider from the drop-down menu

### Keybase

- Settings
- Files
- Enable Keybase in Finder
- Advanced
- Uncheck -> Always stay logged in

### Cryptomator

- TBD

### Alacritty

```
Go to System Preferences > Security & Privacy and give Full Disk Access to Alacritty.
```

### Misc

- Caffeine (keep active)

```
open /Applications/Maccy.app
#Preferences -> Launch at login
```

```
open /Applications/Dozer.app
#Preferences -> Launch at login
```

### MacOS System preferences

- System Preferences -> Touch ID (set Apple ID finger print)
- System Preferences -> Desktop & Screen saver -> Screen saver -> Hot Corners
- System Preferences -> Dock : (size,automatically hide and show the dock)

#### Track Pad

Trackpad 3 fingers drag
You can drag with 3 fingers instead of click and dragging on the trackpad. Turn on this gesture, your fingers will thank you!
You can find it in:

```
Preferences > Accessibility > Pointer Control -> Mouse & Trackpad > Trackpad Options... > Enable dragging > three finger drag
```

#### Enable MacOS TouchID when running `sudo` (NOT WORKING?)

add the bellow in the second line of file `/private/etc/pam.d/sudo`

```
# sudo: auth account password session
auth       sufficient     pam_tid.so
```

#### configure multi-display resolutions and arrangements

```
https://github.com/jakehilborn/displayplacer
```

### 1password

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

### Command Line History

```
keybase fs ls -a -l -t -r keybase://private/${keybase_user_id}/backups/backup.daily/
mv ~/.zsh_history ~/.zsh_history.bak
keybase fs cp keybase://private/${keybase_user_id}/backups/backup.daily/zsh_history_08-05-2022_1652039349 ~/.zsh_history.bak
```

### Obsidian

```
mkdir -p ~/src/nicolas-g/wiki
```

- Open folder as a vault -> choose wiki ^
- settings- > core plugins -> sync -> choose `wiki` vault
- decryption key for wiki vault in password manager
- enable all sync options (audio/video/plugins/configuration etc...)

### ProtonVPN

- Login

### Slack

- add wroskspaces in Slack
  ** spotinst.slack.com
  ** kubernetes.slack.com
  ** istio.slack.com
  ** rancher-users.slack.com
  ** confluentcommunity.slack.com
  ** datadoghq.slack.com

### DasKeyboard

- setup DasKeyboard (https://www.youtube.com/watch?v=St2jUxnCVKI)

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
