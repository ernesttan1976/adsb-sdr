FROM debian:bullseye-slim

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get install -y -q dump1090-mutability && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

EXPOSE 1081 30003 30005

ENTRYPOINT ["/usr/bin/dump1090-mutability"]
CMD ["--device-index", "0", "--gain", "20", "--net", "--net-sbs-port", "30003", "--net-http-port", "1081", "--interactive"]