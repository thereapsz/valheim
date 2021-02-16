# Valheim
Valheim Server for Docker

if env "AUTOUPDATE" is set to true, the server will run steamcmd update and validate before server start.

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
ENV SERVER_NAME="Frostborn Server"
ENV PORT=2456
ENV WORLD="Solus"
ENV PASSWORD="Secret"
ENV SAVE_DIR="valheim/save"
ENV AUTOUPDATE="false"
```
## Compose
```
version: "3.9"
services:
  valheim:
    image: "reapsz:valheim"
    environment:
      - SERVER_NAME="Frostborn Server"
      - PORT=2456
      - WORLD="Solus"
      - SAVE_DIR="valheim/save"
      - AUTOUPDATE="false"
    ports:
      - "2456:2456"
      - "2457:2457"
      - "2458:2458"
```
### for custom volume add:
```
    volumes:
      - YOURE_SERVER_FILES:/valheim
      - YOURE_SAVE_FILES:/valheim/save
```