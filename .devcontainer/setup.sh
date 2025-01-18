# install curl, git, ...
apt-get update
apt-get install -y curl git jq

useradd -m user
su user

# install go
VERSION='1.23.5'
OS='linux'
ARCH='amd64'

curl -OL https://dl.google.com/go/go${VERSION}.${OS}-${ARCH}.tar.gz
tar -C /usr/local -xzf go$VERSION.$OS-$ARCH.tar.gz
rm go$VERSION.$OS-$ARCH.tar.gz

INSTALLED_GO_VERSION=$(go version)
echo "Go version ${INSTALLED_GO_VERSION} is installed"

# install gopls, dlv, hey
echo "Getting development tools"
go install golang.org/x/tools/gopls
go install github.com/go-delve/delve/cmd/dlv
go install github.com/rakyll/hey

# vscode-go dependencies 
echo "Getting dependencies for the vscode-go plugin "
# via: https://github.com/microsoft/vscode-go/blob/master/.travis.yml
go install  github.com/acroca/go-symbols
go install -v github.com/cweill/gotests/...
go install -v github.com/davidrjenni/reftools/cmd/fillstruct
go install -v github.com/haya14busa/goplay/cmd/goplay
go install -v github.com/mdempsky/gocode
go install -v github.com/ramya-rao-a/go-outline
go install -v github.com/rogpeppe/godef
go install -v github.com/sqs/goreturns
go install -v github.com/uudashr/gopkgs/cmd/gopkgs
go install -v github.com/zmb3/gogetdoc
go install -v golang.org/x/lint/golint
go install -v golang.org/x/tools/cmd/gorename
