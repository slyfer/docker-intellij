#!/bin/bash

CONTAINER_NAME=${1:-docker-intellij}
docker start -i ${CONTAINER_NAME}
