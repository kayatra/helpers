#! /bin/bash

source $(dirname $0)/helpers.sh

# Find packages excluding vendor
KAYATRA_PACKAGES=$(go list ./... | grep -v /vendor/)
go test -v ${KAYATRA_PACKAGES}
