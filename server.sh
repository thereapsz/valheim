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

if [[ -f "start_server.sh" ]]; then
  echo "dir not empty"
  bash /valheim/start_server.sh -savedir ${SAVE_DIR} -name ${SERVER_NAME} -port ${PORT} -world ${WORLD} -password ${PASSWORD}
else
  echo "Error during install/startup"
fi