#!/usr/bin/env bash

CONTAINER_IMAGE=ovs-experiments/debug-containers
MOUNT_DIR=${MOUNT_DIR:-${PWD}}
CONTAINER_NAME=${CONTAINER_NAME:-DUMMY}

docker run --privileged --rm -it \
  --name ${CONTAINER_NAME} \
  --network none \
  -v "${MOUNT_DIR}":/workdir \
  -w /workdir \
  ${CONTAINER_IMAGE}
