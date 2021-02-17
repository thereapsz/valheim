FROM alpine:latest

RUN apk update && apk add bash

ENV SERVER_NAME="My Server"
ENV PORT=2456
ENV WORLD="Dedicated"
ENV PASSWORD="Secret"
ENV SAVE_DIR="/valheim/save"
ENV AUTOUPDATE="false"

ENV INTERVAL=60

COPY backup.sh /

CMD bash /backup.sh

#.config/unity3d/IronGate/Valheim/worlds
