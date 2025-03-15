FROM public.ecr.aws/docker/library/alpine:3.21.3 AS blocklist

RUN apk add curl
RUN curl -sSL --compressed 'https://github.com/c032/unbound-blocklist/raw/output/merged.conf' > /tmp/unbound-blocklist.conf

FROM public.ecr.aws/docker/library/alpine:3.21.3

RUN apk add dumb-init unbound

COPY ./etc/unbound/unbound.conf /etc/unbound/unbound.conf
COPY --from=blocklist /tmp/unbound-blocklist.conf /etc/unbound/blocklist.conf

CMD ["/usr/bin/dumb-init", "/usr/sbin/unbound", "-d"]
