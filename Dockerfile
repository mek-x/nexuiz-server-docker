FROM ubuntu:18.04

MAINTAINER Kamil Wcislo <mek.xgt@gmail.com>

RUN apt-get update && apt-get install -y nexuiz-server && \
	 apt-get clean && rm -rf /tmp/* /var/lib/apt/lists/*

RUN groupadd -r nexuiz && useradd --no-log-init -r -g nexuiz nexuiz

ADD server.cfg /usr/share/games/nexuiz/data/server.cfg

WORKDIR /usr/games

USER nexuiz:nexuiz

EXPOSE 26000/udp

CMD ["/usr/games/nexuiz-server"]
