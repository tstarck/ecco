#!/bin/sh

set -x \
  && go fmt \
  && go run http-echo.go
