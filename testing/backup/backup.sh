#!/bin/bash

while :
do
	echo "Starting Backup"
    BACKUPTIME=`date +%b-%d-%y` #get the current date
    DESTINATION=/valheim/backup-$BACKUPTIME.tar.gz #create a backup file using the current date in it's name
    SOURCEFOLDER=/valheim/save/worlds #the folder that contains the files that we want to backup
    tar -cpzf $DESTINATION $SOURCEFOLDER #create the backup
    echo "Backup finished"
	sleep 60
done