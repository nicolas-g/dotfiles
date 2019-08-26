#!/bin/bash

cat > /tmp/files_to_backup.txt << EOF
src
.bash_history
.config
.kube
.ovpn
.password-store
.ssh
.zsh_history
Desktop/desktop_backup
EOF

# create empty files
> /tmp/tf_files_to_delete.txt
> /tmp/git_files_to_delete.txt

# list `.terraform` cache dirs
find ~/src -name ".terraform"  -exec du -ksh  {}>> /tmp/tf_files_to_delete.txt  \;

# list `.git` config dirs
find ~/src -name .git -type d -exec du -ksh  {} >> /tmp/git_files_to_delete.txt  \;

echo "TF files to be deleted"
cat /tmp/tf_files_to_delete.txt

echo "Git files to clear cache"
cat /tmp/git_files_to_delete.txt

echo "Deleting Terraform temporary files"
for f in $(cat /tmp/tf_files_to_delete.txt | awk '{ print $2 }' ) ; do
  ls "$f"
done

echo "Cleaning Git cache files"
for f in $(cat /tmp/git_files_to_delete.txt | awk '{ print $2 }' ) ; do
  cd `dirname "$f"`
  echo "cleaning Git $f"
  echo `pwd`
  git for-each-ref --format="delete %(refname)" refs/original | git update-ref --stdin
  git reflog expire --expire=now --all
  git gc --prune=now
done

# create backup archive
cd ; cat /tmp/files_to_backup.txt | zip -er@ ~/Desktop/backup_dotfiles.zip

exit

