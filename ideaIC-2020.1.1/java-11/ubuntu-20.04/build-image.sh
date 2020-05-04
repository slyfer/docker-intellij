#!/bin/bash
docker build . \
	--build-arg USER_UID=${UID} \
	-t ideaic-2020.1.1:java-11-ubuntu-20.04
