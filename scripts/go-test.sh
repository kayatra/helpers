#! /bin/bash

source $(dirname $0)/helpers.sh

# Find packages excluding vendor
KAYATRA_PACKAGES=$(go list ./... | grep -v /vendor/)
go test -v ${KAYATRA_PACKAGES}


GOFMT_FAILS=$(gofmt -l ${KAYATRA_PACKAGES})
echo -e ${GOFMT_FAILS}

#test $(echo -en \"${GOFMT_FAILS}\" | wc -l) -eq 0
