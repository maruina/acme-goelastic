#!/usr/bin/env bash
set -e

mercurial=`command -v hg || true`

if [[ -z ${mercurial} ]]; then
	apt-get install -y mercurial
fi

export GOPATH=/opt/goapp
export PATH=$PATH:/usr/local/go/bin

# Create the environment
if [[ ! -d /opt/goapp ]]; then
	mkdir /opt/goapp
	mkdir /opt/goapp/src
	cd /opt/goapp/src
	git clone https://bitbucket.org/nutmeglondon/devops-recruitment.git

	# Build the service
	go get devops-recruitment
	go install devops-recruitment
	go build devops-recruitment/main.go
fi