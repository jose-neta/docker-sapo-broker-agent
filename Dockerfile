FROM ubuntu
MAINTAINER Jose Pinheiro Neta <jose.neta@gmail.com>

RUN echo "deb http://archive.ubuntu.com/ubuntu precise main universe" > /etc/apt/sources.list
RUN apt-get update
RUN apt-get upgrade
RUN apt-get clean

# Installation 
# ============
#
# Build it
# --------
#
#   sudo docker build -rm -t="netp/sapo-broker-server" .
#
# Instantiate a container
# -----------------------
#
#   sudo docker run -d netp/sapo-broker-server
#
# Addicional notes
# ----------------
#
# If you're running docker inside a vagrant box you 
# must port forwarding to your host.
#
#   config.vm.forward_port 3323, 3323
#
# NOTE I'll soon commit an image with a SAPO Broker perl client 
# installed.
# 
# Test it
# =======
#
# Find a broker client, and configure the client to 
# produce/listen in 127.0.0.1:3323
# 
# Install SAPO Broker
ADD https://dl-web.meocloud.pt/dlweb/download/DONOTSYNC/SAPO/sapo-broker-4.0.44.tar.gz?public=35139098-49e8-4c18-bfc8-f8f40701b9ae /
RUN mkdir /servers ;\
  cd /servers ;\ 
  mv ../sapo-broker-4.0.44.tar.gz . ;\
  tar -xvzf sapo-broker-4.0.44.tar.gz ;\
  mv sapo-broker-4.0.44 broker;

# Install SAPO Java
ADD https://dl-web.meocloud.pt/dlweb/download/DONOTSYNC/SAPO/sapo-jvm_1.7.0.21_amd64.deb?public=83a4e67f-af6d-4d60-ab6b-5b1b7bc910e8 /
RUN dpkg -i sapo-jvm_1.7.0.21_amd64.deb
RUN apt-get clean
ENV PATH $PATH:/opt/sapojvm/bin

# SAPO Broker port
expose 3323:3323

# Run SAPO Broker
ENTRYPOINT ["/servers/broker/bin/broker.sh"]
