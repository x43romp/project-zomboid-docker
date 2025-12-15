FROM steamcmd/steamcmd:ubuntu-24 as zomboid
ARG VERSION="public"

WORKDIR /pz

COPY versions/${VERSION}.txt /pz/update_zomboid.txt
RUN steamcmd +runscript /pz/update_zomboid.txt

###################################################
FROM zomboid
ENTRYPOINT /opt/pzserver/start-server.sh \
    -servername $SERVERNAME \
    -adminpassword  $ADMINPWD \
    -ip $SERVERIP \
    -port $SERVERPORT \
    -udpport $SERVERUDP \
    -steamvac $STEAMVAC