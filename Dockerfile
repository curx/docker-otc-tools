# Minimal Docker Image for useing OpenTelekomCloud API
# see more at https://github.com/OpenTelekomCloud/otc-tools

FROM alpine:latest

MAINTAINER Thorsten Schifferdecker <schifferdecker@b1-systems.de>

ENV OTC-TOOLS 0.6.34

RUN apk --no-cache add --update \
  bash                          \
  curl                          \
  jq                            \
  && curl -o otc https://raw.githubusercontent.com/OpenTelekomCloud/otc-tools/master/otc \
  && chmod 755 otc

WORKDIR /

ENTRYPOINT ["/otc"]
