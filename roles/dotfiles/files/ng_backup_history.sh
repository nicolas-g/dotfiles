#!/bin/bash -ex
# History Backup rotation

# Backup folder where to move backup files
# Must contain backup.monthly backup.weekly backup.daily folders
BACKUP_DIR=/keybase/private/nicolasg7/backups

# Create required directories if they don't exist
[ -d $BACKUP_DIR/backup.daily ] || mkdir $BACKUP_DIR/backup.daily
[ -d $BACKUP_DIR/backup.weekly ] || mkdir $BACKUP_DIR/backup.weekly
[ -d $BACKUP_DIR/backup.monthly ] || mkdir $BACKUP_DIR/backup.monthly

# Source folder where files are backed
BACKUP_FILE=/Users/ngeorgakopoulos/.zsh_history

email_notificaton=nicolasg@gmail.com

# Destination file names
date_daily=`date +"%d-%m-%Y_%s"`
#date_weekly=`date +"%V sav. %m-%Y"`
#date_monthly=`date +"%m-%Y"`

# Get current month and week day number
month_day=`date +"%d"`
week_day=`date +"%u"`

# Optional check if BACKUP_FILE files exist. Email if failed.
if [ ! -f $BACKUP_FILE ]; then
	ls -l $BACKUP_FILE/ | mail email_notificaton -s "[backup script] Daily backup failed! Please check for missing files."
fi

# It is logical to run this script daily. We take files from BACKUP_FILE folder and move them to
# appropriate destination folder

  # On first month day do
if [ "$month_day" -eq 1 ] ; then
  destination=$BACKUP_DIR/backup.monthly/
  else
  # On saturdays do
  if [ "$week_day" -eq 6 ] ; then
  destination=$BACKUP_DIR/backup.weekly/
  else
  # On any regular day do
  destination=$BACKUP_DIR/backup.daily/
  fi
fi

# Copy the file to backup dir
# ${BACKUP_FILE##*/.} <= get only basename of the full path and remove leading `.`
cp -aR $BACKUP_FILE $destination/${BACKUP_FILE##*/.}_$date_daily

# daily - keep for 14 days
find $BACKUP_DIR/backup.daily/ -maxdepth 1 -mtime +14 -type d -exec rm -rv {} \;

# weekly - keep for 60 days
find $BACKUP_DIR/backup.weekly/ -maxdepth 1 -mtime +60 -type d -exec rm -rv {} \;

# monthly - keep for 300 days
find $BACKUP_DIR/backup.monthly/ -maxdepth 1 -mtime +300 -type d -exec rm -rv {} \;

exit
