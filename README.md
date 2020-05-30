# My Dotfiles Project

A never ending project..

I"m using Ansible in order to setup my local dev machine and manage my dot files as for example:

- shell aliases, environments
- homebrew packages
- various configs for MacOS, vim, git, ansible, tmux and zsh/bash
- etc ...

#### Project Layout

```
roles/dotfiles
├── defaults
│   └── main.yml
├── files
│   ├── ansible.cfg
│   ├── awscli_config
│   ├── bashrc
│   ├── functions
│   ├── fzf.zsh
│   ├── ng_backup.sh
│   ├── tf_latest_install.sh
│   ├── tmux-macos.conf
│   ├── tmux.conf
│   ├── tmux_devops_session.yml
│   └── vimrc
├── tasks
│   ├── alacritty.yml
│   ├── ansible_conf.yml
│   ├── awscli.yml
│   ├── check-prereqs.yml
│   ├── dotfiles.yml
│   ├── extras.yml
│   ├── gcloud.yml
│   ├── homebrew.yml
│   ├── macos.yml
│   ├── main.yml
│   ├── open_vpn.yml
│   ├── packages.yml
│   ├── pianobar.yml
│   ├── ssh.yml
│   ├── terraform.yml
│   ├── tmux.yml
│   ├── vim.yml
│   └── zsh.yml
├── templates
│   ├── alacritty.yml.j2
│   ├── aliases.j2
│   ├── awscli_credentials.j2
│   ├── env.j2
│   ├── gcloud_config.j2
│   ├── gitconfig.j2
│   ├── ovpn.conf.j2
│   ├── pianobar_connfig.j2
│   ├── ssh_config.j2
│   └── zshrc.j2
└── vars
    └── main.yml
```

## Installation requirements

Run

```
run_me_first.sh
```

## Usage

Now you should be ready to run Ansible

```bash
ansible-playbook dotfiles.yml -v -D
```

## Todo

### Local monitoring

https://github.com/prometheus/node_exporter/issues/610

I am using below command to run a node_export docker container on Mac.

```
docker run -d -p 9100:9100 \
  -v "/proc:/host/proc:ro" \
  -v "/sys:/host/sys:ro" \
  -v "/:/rootfs:ro" \
  --net="host" \
  quay.io/prometheus/node-exporter \
    -collector.procfs /host/proc \
    -collector.sysfs /host/sys \
    -collector.filesystem.ignored-mount-points "^/(sys|proc|dev|host|etc)($|/)"
```

The container can be run but the port number 9100 is not listenning. Is there anything need to be configured on Mac? As I know, Mac doesn't have /proc directory.

Here is the command that worked for me on Docker for Mac:

```
docker service create --name node \
 --mode global \
 --mount type=bind,source=/proc,target=/host/proc \
 --mount type=bind,source=/sys,target=/host/sys \
 --mount type=bind,source=/,target=/rootfs \
 --network prom \
 prom/node-exporter \
  --path.procfs /host/proc \
  --path.sysfs /host/sys \
  --collector.filesystem.ignored-mount-points "^/(sys|proc|dev|host|etc)($|/)"
```

prom is a separately created overlay network.

### Others

- zsh auto notify : https://github.com/MichaelAquilina/zsh-auto-notify

Update App Store apps

```
sudo softwareupdate -i -a
```

check how to use already installed :

- https://github.com/psprint/zsh-navigation-tools
- https://grml.org/zsh/#zshlovers

create virtual_envs (ansible/magic-wormhole ?)

fonts : https://github.com/atomantic/dotfiles/blob/0f1df7b11e12482d955e4f2e0109529325c491c9/install.sh#L238

#### Kubectl

https://github.com/ahmetb/kubectl-aliases
kube-ps1 is not working (https://github.com/jonmosco/kube-ps1)
kubectl plugin list / https://github.com/kubernetes-sigs/krew

#### Tmux

https://github.com/samoshkin/tmux-config
https://github.com/jonmosco/kube-tmux/blob/master/kube.tmux

OSX defaults:
https://github.com/mathiasbynens/dotfiles/blob/master/.macos#L415
https://github.com/paulirish/dotfiles/blob/master/.osx#L163
https://github.com/mathiasbynens/dotfiles/blob/master/.macos
https://github.com/atomantic/dotfiles/blob/0f1df7b11e12482d955e4f2e0109529325c491c9/install.sh#L514
https://github.com/mathiasbynens/dotfiles/blob/master/.macos
https://github.com/driesvints/dotfiles/blob/master/.macos

#### iTerm key for similar ctrl + > move

```
Preferences > Keys (or Preferences > Profiles > Keys)
Click the plus.
move forward one word

option+right
send escape sequence
f
move back one word

option+left
send escape sequence
b
```

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
