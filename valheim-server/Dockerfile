FROM ubuntu:20.04

ENV SERVER_NAME="My Server"
ENV PORT=2456
ENV WORLD="Dedicated"
ENV PASSWORD="Secret"
ENV SAVE_DIR="/valheim/save"
ENV AUTOUPDATE="false"

RUN apt-get update && \
    apt-get install -y lib32gcc1 curl bash && \
    apt-get clean

#install steamcmd
RUN mkdir /steamcmd
WORKDIR /steamcmd
RUN curl -sqL 'https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz' | tar zxvf -

#prep for start
EXPOSE 2457
EXPOSE 2458
EXPOSE 2456

RUN mkdir /valheim
RUN mkdir /valheim/save
RUN mkdir /valheim/backup
WORKDIR /valheim
COPY start.sh /valheim
#COPY backup.sh /valheim

CMD bash /valheim/start.sh

#.config/unity3d/IronGate/Valheim/worlds
