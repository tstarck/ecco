# Multi-stage build for http-echo

FROM golang:alpine AS buildtainer

WORKDIR /src

ADD . /src

RUN set -x \
  && go build -o http-echo


FROM alpine

COPY --from=buildtainer /src/http-echo /app/http-echo
COPY entrypoint.sh /app/entrypoint.sh

RUN set -x && chmod -c 0755 /app/entrypoint.sh

ENTRYPOINT ["/app/entrypoint.sh"]
