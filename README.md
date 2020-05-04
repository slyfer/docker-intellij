# Docker image for IntelliJ IDEA

A dockerized IntelliJ IDEA. Each image contains:

- JDK
- Intellij Idea
- git
- Maven

The docker user is `developer`, this user has no password and can use `sudo` with no limitation

## Credits
This project is based on this two repositories in any specifc order

- https://github.com/dlsniper/docker-intellij
- https://github.com/fgrehm/docker-netbeans

## Requirements

- Docker engine
- An X11 socket

## Folder structure

Everey variant of the Dockerfile and utility scripts are an folder that has the following structure:

`<idea-version>/<java-version>/<os>`

For example ideaIC-2020.1.1/java-11/ubuntu-20.04 contatins files to build an image based on Ubuntu 20.04 with java 11 and Idea Community Edition 2020.1.1

# Installation steps

In order to use dockerized IntelliJ IDEA you must:

1. Choose the variant you prefer
1. Create the image
1. Create the container
1. Run it

## Image creation

Run `build-image.sh`

## Container creation

Run `create-container.sh`

Optional parameters:

1. CONTAINER_NAME: the default is `docker-intellij`
2. IDEA_CONFIG_DIR: the default is `~/.config/docker-intellij`
3. PROJECTS_DIR: the defautl is `-~/IdeaProjects`

Full parameters example:

`./create-container.sh my-funny-docker-idea /tmp/idea /tmp/projects`

## Run idea

Run `run.sh`

Optional parameters:

1. CONTAINER_NAME: the default is `docker-intellij`. If you have changed the container name on creation, you must pass the new name to run script

Example: `./run.sh my-funny-docker-idea`
