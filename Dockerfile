# Dockerfile for ecco

FROM golang:alpine AS buildtainer

WORKDIR /src

ADD . /src

RUN set -x \
  && go build -o ecco


FROM alpine

COPY --from=buildtainer /src/ecco /app/ecco
COPY entrypoint.sh /app/entrypoint.sh

RUN set -x && chmod -c 0755 /app/entrypoint.sh

ENTRYPOINT ["/app/entrypoint.sh"]
