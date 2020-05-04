FROM ubuntu:20.04

MAINTAINER Ciro Cardone "cardone.ciro@gmail.com"

ARG USER_UID=1234

# DEFAULT LOCALE
ENV LANG C.UTF-8

# SET NOT INTERACTIVE
ENV DEBIAN_FRONTEND noninteractive
ENV DEBCONF_NONINTERACTIVE_SEEN true

# INSTALL REQUIRED PACKAGES
RUN apt-get update && \
    apt-get install -y --no-install-recommends software-properties-common libxext-dev libxrender-dev libxtst-dev && \
    apt-get install -y --no-install-recommends sudo openssh-client vim git wget openjdk-11-jdk maven && \
    apt-get autoclean -y && \
    apt-get autoremove && \
    rm -rf /var/lib/apt/lists/* && \
    rm -rf /tmp/* 

# Creating user: developer'
RUN useradd -m -d /home/developer/ -G sudo developer -s /bin/bash -u $USER_UID && \
    echo "developer ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers

# VOLUMES
RUN mkdir -p /home/developer/.config/JetBrains && \
    mkdir -p /home/developer/IdeaProjects && \
    mkdir -p /home/developer/.m2 && \
    mkdir -p /home/developer/.ssh && \
    chown -R developer:developer home/developer

VOLUME ["/home/developer/.config/JetBrains","/home/developer/IdeaProjects", "/home/developer/.m2"]

USER developer
WORKDIR /home/developer

# ADD INTELLIJ
RUN mkdir -p idea/intellij && \
    wget https://download.jetbrains.com/idea/ideaIC-2020.1.1-no-jbr.tar.gz -O idea/intellij.tar.gz && \
    tar -xvf idea/intellij.tar.gz --strip-components=1 -C idea/intellij && \
    rm -f idea/intellij.tar.gz && \
    rm -rf idea/intellij/plugins/android && \
    rm -rf idea/intellij/plugins/Kotlin

# RUN IDEA AS DEFAULT
ENTRYPOINT /home/developer/idea/intellij/bin/idea.sh
