# Use debian, slim version, to get a familiar environment
# For local testing - docker run --rm -it debian:buster-slim /bin/bash
FROM ubuntu:rolling

# Run updates for Ubuntu
RUN apt-get -y update && apt-get -y upgrade
RUN apt-get -y install software-properties-common

# Install Python
RUN apt-get -y install Python3.10


CMD echo "Hello, Dumbass, this is a test"