# valheim
Valheim Server for Docker


#Start server

## qucik start
1. docker run -itd --name Valheim -p 2456:2456 -p 2457:2457 -p 2458:2458 reapsz/valheim

## change where files are saved
server files are stored under "/valheim", the world/save file is stored under "/valheim/save" (by default)

docker run -itd --name Valheim -p 2456:2456 -p 2457:2457 -p 2458:2458 -v YOURE_SERVERFILE_PATH:/valheim -v YOURE_SAVE_LOCATION:/valheim/save reapsz/valheim

## env variables

ENV SERVER_NAME="Frostborn Server"
ENV PORT=2456
ENV WORLD="Solus"
ENV PASSWORD="Secret"
ENV SAVE_DIR="valheim/save"
ENV AUTOUPDATE="false"
