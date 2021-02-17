#!/bin/bash

while :
do
	echo "Starting Backup"
    #find /valheim/backup -type f -mtime +30 -exec rm -f {} \; 
    BACKUPTIME=`date +%b-%d-%y` #get the current date
    DESTINATION=/valheim/backup-$BACKUPTIME.tar.gz #create a backup file using the current date in it's name
    SOURCEFOLDER=/valheim/save/worlds #the folder that contains the files that we want to backup
    sleep 1
    tar -cpzf $DESTINATION $SOURCEFOLDER #create the backup
    if [ $? -eq 0 ]; then
      echo OK
    else
      echo "BACKUP FAILED"
    fi
    echo "Backup finished"
	sleep 60
done

#tar -tf 