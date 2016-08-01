FROM alpine:edge
MAINTAINER "Johann Weging <johann@weging.com>"

RUN apk add --update --no-cache iproute2

ADD traffic-limiter /

ENTRYPOINT /traffic-limiter
