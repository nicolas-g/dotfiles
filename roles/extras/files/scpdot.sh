#!/bin/bash

# Define a list of .dot files that will be archived and copied
# .oh-my-zsh <- is a dir and would slow the copy since it can be several MB in size
cat << EOF > /tmp/dotfiles_list.txt
.zshrc
.vimrc
.tmux.conf
EOF

# because `$HOME` might be different locally with the remote
# we need to first construct the remote_home value
remote_home=$(ssh $1 echo '${HOME}')

tar c -C ${HOME} -T /tmp/dotfiles_list.txt | ssh $1 "tar mx -C ${remote_home}"

# change shell ?
#ssh -t $1 "/bin/zsh"
