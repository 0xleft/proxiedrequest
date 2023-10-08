FROM ubuntu:latest

RUN apt-get update && apt-get install -y \
    tor \
    && rm -rf /var/lib/apt/lists/*

RUN echo "SocksPort 0.0.0.0:9050" >> /etc/tor/torrc

EXPOSE 9050

CMD ["/usr/bin/tor"]