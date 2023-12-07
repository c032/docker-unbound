# docker-unbound

Docker image for Unbound.

## Usage

Start Unbound from Docker:

```sh
docker run --rm -it -p '5353:53/udp' 'ghcr.io/c032/docker-unbound:main'
```

Make a DNS query using `drill`:

```sh
drill -p 5353 @127.0.0.1 A example.com.
```
