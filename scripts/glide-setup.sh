#! /bin/bash

source $(dirname $0)/helpers.sh

go get github.com/Masterminds/glide
${GOPATH}/bin/glide install
