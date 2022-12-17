# Test Update
# Use ubuntu to get a familiar environment
# For local testing - docker run --rm -it debian:buster-slim /bin/bash
FROM ubuntu:rolling

# Updating and adding of tools/apps/languages

RUN apt-get update && \
      apt-get -y install software-properties-common \
      apt-get -y install sudo \
      apt-get -y install ruby \
      apt-get -y install python3.11 \
      apt-get -y install nodejs \
      apt-get -y install golang-go

# Adding the following to give me a user inside the container with sudo
# access

RUN useradd -m docker && echo "docker:docker" | chpasswd && adduser docker sudo

USER docker
CMD /bin/bash

# The following will copy a script to the container for execution
COPY scripts/linux-install.sh /tmp

# CMD /tmp/.linux-install.sh