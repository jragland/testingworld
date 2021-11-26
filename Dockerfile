# Use debian, slim version, to get a familiar environment
# For local testing - docker run --rm -it debian:buster-slim /bin/bash
FROM ubuntu:impish-20211015

# Run updates for Ubuntu
RUN apt-get -y update && apt-get -y upgrade

CMD echo "Hello, Dumbass"