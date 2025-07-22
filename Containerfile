FROM debian:trixie-slim

ENV DEBIAN_FRONTEND=noninteractive

RUN groupadd -g 999 dovecot
RUN useradd -d /var/lib/dovecot -r -s /bin/false -u 999 -g 999 dovecot
RUN useradd -d /var/lib/dovecot -r -s /bin/false -u 999 -g 999 -o dovenull

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y --no-install-recommends dovecot-core && \
    rm -rf /etc/dovecot/* /run/*

VOLUME ["/var/lib/dovecot"]

USER dovecot
ENTRYPOINT ["/usr/sbin/dovecot", "-F"]
CMD []
