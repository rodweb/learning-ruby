#!/bin/sh
docker run --rm -it -v "$PWD":/usr/src -w /usr/src ruby ruby $1
