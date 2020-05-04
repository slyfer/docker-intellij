#!/bin/bash

CONTAINER_NAME=${1:-docker-intellij}
IDEA_CONFIG_DIR=${2:-~/.config/docker-intellij}
PROJECTS_DIR=${3:-~/IdeaProjects}
IMAGE_NAME="ideaic-2020.1.1:java-11-ubuntu-20.04"

mkdir -p "${IDEA_CONFIG_DIR}"
mkdir -p "${PROJECTS_DIR}"

docker container rm ${CONTAINER_NAME}

docker create \
	-e DISPLAY=${DISPLAY} \
	-v /tmp/.X11-unix:/tmp/.X11-unix \
	-v ~/.ssh:/home/developer/.ssh \
	-v "${IDEA_CONFIG_DIR}":/home/developer/.config/JetBrains \
	-v "${PROJECTS_DIR}":/home/developer/IdeaProjects \
	-v ~/.ssh:/home/developer/.ssh \
	-v ~/.m2:/home/developer/.m2 \
	-v ~/.gitconfig:/home/developer/.gitconfig \
	--name ${CONTAINER_NAME} \
        ${IMAGE_NAME}
