FROM ubuntu:latest

RUN apt-get update \
  && apt-get install -y \
  bind9 \
  bind9utils \
  bind9-doc

# Copy configuration files
COPY named.conf.options /etc/bind/
COPY named.conf.local /etc/bind/
COPY db.lan.test /etc/bind/

# expose some ports
EXPOSE 53/udp
EXPOSE 53/tcp

# Run bind9
CMD ["/usr/sbin/named", "-4", "-f", "-u", "bind"]