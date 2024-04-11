#!/bin/ash
pkg add docker
rc-service docker start
rc-update add docker

mkdir -p data/bitping