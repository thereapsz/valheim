#!/bin/bash
echo "${SERVER_NAME} with world: ${WORLD}"

if [ "${AUTOUPDATE}" == "true" ]; then
  echo "Update True"
    bash /steamcmd/steamcmd.sh +login anonymous +force_install_dir /valheim +app_update 896660 validate +quit
fi

if [[ -f "start_server.sh" ]]; then
  echo "dir not empty, skipping..."
else
  echo "Dir is Empty"
  bash /steamcmd/steamcmd.sh +login anonymous +force_install_dir /valheim +app_update 896660 validate +quit
fi

# Start the first process
bash /valheim/start_server.sh -savedir ${SAVE_DIR} -name ${SERVER_NAME} -port ${PORT} -world ${WORLD} -password ${PASSWORD} -D
status=$?
if [ $status -ne 0 ]; then
  echo "Failed to start my_first_process: $status"
  exit $status
fi

# Start the second process
bash /backup.sh -D
status=$?
if [ $status -ne 0 ]; then
  echo "Failed to start my_second_process: $status"
  exit $status
fi

while sleep 60; do
  ps aux |grep my_first_process |grep -q -v grep
  PROCESS_1_STATUS=$?
  ps aux |grep my_second_process |grep -q -v grep
  PROCESS_2_STATUS=$?
  # If the greps above find anything, they exit with 0 status
  # If they are not both 0, then something is wrong
  if [ $PROCESS_1_STATUS -ne 0 -o $PROCESS_2_STATUS -ne 0 ]; then
    echo "One of the processes has already exited."
    exit 1
  fi
done
