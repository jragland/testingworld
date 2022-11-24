# Use debian, slim version, to get a familiar environment
# For local testing - docker run --rm -it debian:buster-slim /bin/bash
FROM ubuntu:22.04

# Updating and adding of tools/apps

RUN apt-get update && \
      apt-get -y install sudo \
      apt-get -y install ruby \
      apt-get -y install python3.11

# Adding the following to give me a user inside the container with sudo
# access

RUN useradd -m docker && echo "docker:docker" | chpasswd && adduser docker sudo



USER docker
CMD /bin/bash

# I am commenting the following in place of running an install script
# # Run updates for Ubuntu
# RUN apt-get -y update && apt-get -y upgrade
# RUN apt-get -y install software-properties-common

# # Install Python
# RUN apt-get -y install Python3.10
# # Echo a message from Python back to the user
# CMD echo "Hello, Dumbass, this is a test"

# The following will copy a script to the container for execution
COPY scripts/linux-install.sh /tmp

# CMD /tmp/.linux-install.sh