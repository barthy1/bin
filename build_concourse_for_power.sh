#!/usr/bin/env bash

set -eu

rm -rf resources
mkdir resources
cp -r ${1}/* resources
#sudo docker build -t concourse_bin -f Dockerfile_ppc64le .
sudo docker build -t concourse_res -f Dockerfile_build --no-cache .
rm -rf ${PWD}/artifacts
mkdir -p ${PWD}/artifacts
sudo docker run --rm -i -v ${PWD}/artifacts:/artifacts concourse_res bash << COMMANDS
cp /tmp/binary/concourse_linux_amd64 /artifacts/concourse_linux_ppc64le
COMMANDS