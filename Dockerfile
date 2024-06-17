FROM steamcmd/steamcmd:ubuntu-24 as zomboid

WORKDIR /pz

COPY update_zomboid.txt /pz/update_zomboid.txt
RUN steamcmd +runscript /pz/update_zomboid.txt

###################################################
FROM zomboid
ENTRYPOINT /opt/pzserver/start-server.sh -servername $SERVERNAME -adminpassword hello $ADMINPWD -ip $SERVERIP -port $SERVERPORT -udpport $SERVERUDP -steamvac $STEAMVAC