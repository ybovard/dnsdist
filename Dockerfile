FROM debian:stretch-slim

RUN apt-get -y update && apt-get -y upgrade && apt-get -y install gnupg2

COPY pdns.list /etc/apt/sources.list.d/pdns.list
COPY dnsdist /etc/apt/preferences.d/dnsdist
COPY powerdns-pub.asc /tmp/powerdns-pub.asc

RUN apt-key add /tmp/powerdns-pub.asc \
    && apt-get -y update \
    && apt-get -y install dnsdist \
    && useradd -d /tmp -u 1000 dnsdist

USER 1000
ENTRYPOINT [ "/usr/bin/dnsdist" ]
CMD ["-C", "/etc/dnsdist/dnsdist.conf", "--local=0.0.0.0:5300" ]
