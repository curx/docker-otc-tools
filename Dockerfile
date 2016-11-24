# Minimal Docker Image for useing OpenTelekomCloud API
# see more at https://github.com/OpenTelekomCloud/otc-tools

FROM alpine:latest

MAINTAINER Thorsten Schifferdecker <schifferdecker@b1-systems.de>

ENV OTC-TOOLS 0.6.34

RUN apk --no-cache add --update \
  bash                          \
  curl                          \
  jq                            \
  libxml2                       \
  && rm -rf /var/cache/apk/*    \
  && curl -o otc https://raw.githubusercontent.com/OpenTelekomCloud/otc-tools/master/otc \
  && chmod 755 otc

COPY libs3-2.0-r1.apk /libs3-2.0-r1.apk
RUN apk --no-cache --allow-untrusted add /libs3-2.0-r1.apk \
  && rm -rf /var/cache/apk/* /libs3-2.0-r1.apk

WORKDIR /

ENTRYPOINT ["/otc"]
