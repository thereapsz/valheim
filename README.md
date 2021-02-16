# Valheim
Valheim Server for Docker

## Quick start

```
docker run -itd --name Valheim -p 2456:2456 -p 2457:2457 -p 2458:2458 reapsz/valheim
```

## change where files are saved
server files are stored under "/valheim", the world/save file is stored under "/valheim/save" (by default)

```
docker run -itd --name Valheim -p 2456:2456 -p 2457:2457 -p 2458:2458 -v YOURE_SERVERFILE_PATH:/valheim -v YOURE_SAVE_LOCATION:/valheim/save reapsz/valheim
```

## env variables

```
docker run -itd --name Valheim \
   -p 2456:2456 -p 2457:2457 -p 2458:2458 \
   -v YOURE_SERVERFILE_PATH:/valheim \
   -v YOURE_SAVE_LOCATION:/valheim/save \
   -e SERVER_NAME='My Server' \
   -e PORT='2456' \
   -e WORLD='MyWorldName' \
   -e PASSWORD='MyServerPassword' \
   -e SAVE_DIR='/valheim/save' \
   -e AUTOUPDATE='false' \
   reapsz/valheim
```
(defaults)
```
1. ENV SERVER_NAME="Frostborn Server"
2. ENV PORT=2456
3. ENV WORLD="Solus"
4. ENV PASSWORD="Secret"
5. ENV SAVE_DIR="valheim/save"
6. ENV AUTOUPDATE="false"
```
