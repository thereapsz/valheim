FROM ubuntu:18.04

ENV SERVER_NAME="Frostborn Server"
ENV PORT=2456
ENV WORLD="Solus"
ENV PASSWORD="Secret"
ENV SAVE_DIR="valheim/save"
ENV AUTOUPDATE="false"

RUN apt-get update && \
    apt-get install -y lib32gcc1 curl bash && \
    apt-get clean

#install steamcmd
RUN mkdir /steamcmd
WORKDIR /steamcmd
RUN curl -sqL 'https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz' | tar zxvf -

#install game files
#RUN mkdir /valheim
#RUN ./steamcmd.sh +login anonymous +force_install_dir /valheim +app_update 896660 validate +quit

#prep for start
EXPOSE 2457
EXPOSE 2458
EXPOSE 2456

RUN mkdir /valheim
RUN mkdir /valheim/save
WORKDIR /valheim
COPY server.sh /

CMD bash /server.sh

#sudo docker run -itd -p 2456-2458:2456-2458 -e SERVER_NAME="ReapsZ" valheim:latest

#mkdir ${PWD}/valheim-server 
#make the directory if its not there
#docker run -it -v ${PWD}/valheim-server:/data steamcmd/steamcmd:latest +login anonymous +force_install_dir /data +app_update 896660 +quit

#docker run -it -v ${PWD}/valheim-server:/data -p 2456:2456/udp -p 2457:2457/udp steamcmd/steamcmd:latest bash /data/start_server.sh

#.config/unity3d/IronGate/Valheim/worlds