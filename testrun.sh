#!/bin/sh

set -x \
  && go fmt \
  && go run ecco.go
