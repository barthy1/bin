#!/usr/bin/env bash

set -e -u -x

export GOPATH=/tmp/gopath
mkdir final-version
mkdir fly-rc
echo "">fly-rc/fly_something
git clone --recursive https://github.com/barthy1/bin -b ppc64le_main /tmp/gopath/src/github.com/concourse/bin
git clone --recursive https://github.com/cloudfoundry/garden-runc-release -b v1.9.0 /tmp/garden-runc-release
cd /tmp/garden-runc-release
#git reset --hard 7d473a79f6b1bcbf147c1d8e0b9c33cdee1bc0a1
git submodule update
git clone --recursive https://github.com/concourse/concourse -b master /tmp/concourse
cd /tmp/concourse/src/github.com/concourse/bin
git remote add ppc64le https://github.com/barthy1/bin
git fetch ppc64le
git checkout ppc64le_main
#git clone --recursive https://github.com/vito/houdini /tmp/houdini

cd /tmp
sh -c 'echo "3.8.0" > final-version/version'
