FROM alpine:latest

RUN apk update && apk add bash

ENV SERVER_NAME="My Server"
ENV PORT=2456
ENV WORLD="Dedicated"
ENV PASSWORD="Secret"
ENV SAVE_DIR="/valheim/save"
ENV AUTOUPDATE="false"
#default 15minutes
ENV INTERVAL=900

COPY backup.sh /

CMD bash /backup.sh

#.config/unity3d/IronGate/Valheim/worlds
