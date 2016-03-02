FROM golang:latest
MAINTAINER jgsqware
COPY hyperclair /opt/hyperclair
COPY .hyperclair.yml /opt/.hyperclair.yml
EXPOSE 9999
RUN mkdir -p /data
WORKDIR /opt
ENTRYPOINT ["/opt/hyperclair","serve"]
