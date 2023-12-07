FROM alpine:3.18.4

RUN apk update && apk add unbound curl
RUN curl -sSL --compressed 'https://github.com/c032/unbound-blocklist/raw/output/merged.conf' > /etc/unbound/blocklist.conf

COPY ./etc/unbound/unbound.conf /etc/unbound/unbound.conf

CMD ["/usr/sbin/unbound", "-d"]
