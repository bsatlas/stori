#!/bin/sh

jsonnet -J $1 -m $2 $2/openapi.jsonnet
