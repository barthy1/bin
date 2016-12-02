#!/bin/bash

set -e -u -x

export GOPATH=/tmp/gopath
mkdir final-version
#mkdir cli-artifacts
mkdir fly-rc
echo "">fly-rc/fly_something
git clone --recursive https://github.com/barthy1/bin -b ppc64le /tmp/gopath/src/github.com/concourse/bin
git clone --recursive https://github.com/cloudfoundry/garden-runc-release -b develop /tmp/garden-runc-release
cd /tmp/garden-runc-release
git reset --hard 21954bb
git submodule update
git clone --recursive https://github.com/concourse/concourse -b develop /tmp/concourse
git clone --recursive https://github.com/vito/houdini /tmp/houdini


cd /tmp
sh -c 'date +%s > final-version/version'
#./bin/ci/build-linux
