
test -z "${GOPATH}" && echo "GOPATH not set!" >&2 && exit 1

BASE_ORG="${GOPATH}/src/github.com/kayatra"
BASE_PATH="$(dirname $0)/../"
