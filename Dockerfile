# Test Update
# Use ubuntu to get a familiar environment
# For local testing:
#     docker run --rm -it debian:buster-slim \
#     /bin/bash
FROM --platform=linux/amd64 ubuntu:noble

# Updating and adding of tools/apps/languages
RUN apt-get -qq -y update && \
      apt-get -qq -y upgrade && \
      apt-get -y autoclean && \
      apt-get -y autoremove && \
      apt-get -y software-properties-common vim sudo \
      rm -rf /var/lib/apt/lists/*      

# Adding the following to give me a user inside
# the container with sudo access
RUN useradd -m docker && echo "docker:docker" | chpasswd && \
      adduser docker sudo
USER docker

# The following will copy scripts to 
# the container for execution
COPY scripts/linux-install.sh /tmp
COPY scripts/ruby-test-script.rb /tmp

# The following will execute the copied script
# in the container

# Starting CMD
CMD /bin/bash