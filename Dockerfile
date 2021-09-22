FROM cm2network/steamcmd
USER root
RUN apt-get update && \
	apt-get install -y ruby && \
    apt-get clean -y autoclean && \
    apt-get autoremove -y && \
    rm -rf /var/lib/{apt,dpkg} /var/{cache,log}

WORKDIR /home/steam
USER steam

ADD kf2_functions.sh kf2_functions.sh 
ADD main main
ADD configurator configurator

# Steam port
EXPOSE 20560/udp

# Query port - used to communicate with the master server
EXPOSE 27015/udp

# Game port - primary comms with players
EXPOSE 7777/udp

# Web Admin port
EXPOSE 8080/tcp

ENTRYPOINT ["/bin/bash", "main"]

