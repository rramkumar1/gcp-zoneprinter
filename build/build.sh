set -o errexit
set -o nounset
set -o pipefail

if [ -z "${PKG}" ]; then
    echo "PKG must be set"
    exit 1
fi
if [ -z "${ARCH}" ]; then
    echo "ARCH must be set"
    exit 1
fi

export CGO_ENABLED=0
export GOARCH="${ARCH}"
if [ $GOARCH == "amd64" ]; then
    export GOBIN="$GOPATH/bin/linux_amd64"
fi

go install -installsuffix "static" ./...
