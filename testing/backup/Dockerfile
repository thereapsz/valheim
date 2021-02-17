FROM ubuntu:20.04

ENV SERVER_NAME="My Server"
ENV PORT=2456
ENV WORLD="Dedicated"
ENV PASSWORD="Secret"
ENV SAVE_DIR="/valheim/save"
ENV AUTOUPDATE="false"

COPY backup.sh /

CMD bash /backup.sh

#.config/unity3d/IronGate/Valheim/worlds
