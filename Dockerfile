FROM alpine:3.19

RUN apk update && apk add unbound curl dumb-init
RUN curl -sSL --compressed 'https://github.com/c032/unbound-blocklist/raw/output/merged.conf' > /etc/unbound/blocklist.conf

COPY ./etc/unbound/unbound.conf /etc/unbound/unbound.conf

CMD ["/usr/bin/dumb-init", "/usr/sbin/unbound", "-d"]
