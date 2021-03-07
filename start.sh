#!/bin/bash
echo "${SERVER_NAME} with world: ${WORLD} savedir: $SAVE_DIR"


#check if auto update is enabled
echo "AutoUpdate Check"
if [ "${AUTOUPDATE}" == "true" ]; then
  echo "Update True"
  bash /steamcmd/steamcmd.sh +login anonymous +force_install_dir /valheim +app_update 896660 validate +quit
fi

#check if game is installed
echo "already installed check"
if [[ -f "start_server.sh" ]]; then
  echo "dir not empty, skipping..."
else
  echo "Dir is Empty, starting install"
  bash /steamcmd/steamcmd.sh +login anonymous +force_install_dir /valheim +app_update 896660 validate +quit
fi

#start game server
echo "startserver check"
if [[ -f "start_server.sh" ]]; then
  echo "start files found, trying to start server"
  #copy from valheim start script
  export templdpath=$LD_LIBRARY_PATH
  export LD_LIBRARY_PATH=./linux64:$LD_LIBRARY_PATH
  export SteamAppId=892970
  ./valheim_server.x86_64 -savedir "$SAVE_DIR" -name ${SERVER_NAME} -port ${PORT} -world ${WORLD} -password ${PASSWORD}
  export LD_LIBRARY_PATH=$templdpath
  #copy from valheim start script
else
  echo "Error during install/startup"
  exit
fi