FROM ubuntu
MAINTAINER Jose Pinheiro Neta <jose.neta@gmail.com>
# Build the image with 
#  `sudo docker build -rm -t="jpn/sapo-broker" .`
# and start the container with:
# `sudo docker run -t -i jpn/sapo-broker /bin/bash` 

RUN echo "deb http://archive.ubuntu.com/ubuntu precise main universe" > /etc/apt/sources.list
RUN apt-get update
RUN apt-get upgrade
RUN apt-get clean

# Install some utils
RUN apt-get install -y -q curl
RUN apt-get install -y -q wget
RUN apt-get install -y -q tmux
RUN apt-get install -y -q git
RUN apt-get install -y -q vim
RUN apt-get clean

# Install Broker Client

## Thrift dependencies (http://thrift.apache.org/docs/install/ubuntu/)
RUN apt-get install -y -q build-essential
RUN apt-get clean
RUN apt-get install -y -q perl libboost-dev libboost-test-dev libboost-program-options-dev libevent-dev automake libtool flex bison pkg-config libssl-dev 
RUN apt-get clean
# you may need to install dependencies from CPAN
# http://git-wip-us.apache.org/repos/asf/thrift.git
RUN cd /home && curl -O 'http://mirrors.fe.up.pt/pub/apache/thrift/0.9.1/thrift-0.9.1.tar.gz' && tar -xzf thrift-0.9.1.tar.gz && cd thrift-0.9.1/lib/perl/ && perl Makefile.PL && make && make install

#RUN git clone git@github.com:sapo/sapo-broker.git => DOES NOT COMPUTE!
RUN apt-get install zip unzip
RUN apt-get clean
RUN cd /home && wget 'http://github.com/sapo/sapo-broker/archive/master.zip' && unzip master.zip

# From now on you must procee manualy :(
#
# root@ef352fd0e356:/home/sapo-broker-master/clients/perl-component# perl Makefile.PL
# Do you want to use the HTTP interface to authenticate with SAPO STS? [yes]
# Do you want to use the SSL transport [yes]
# Do you want to install support for protobufs(XS) [yes] no
# Do you want to install support for Thrift [yes] yes
# Do you want to install support for Thrift(XS) [yes]
# Checking if your kit is complete...
# Looks good
# Warning: prerequisite Crypt::SSLeay 0 not found.
# Warning: prerequisite IO::Socket:SSL 0 not found.
# Warning: prerequisite JSON::Any 0 not found.
# Warning: prerequisite LWP 0 not found.
# Warning: prerequisite Readonly 0 not found.
# Warning: prerequisite XML::LibXML 0 not found.
# Warning: prerequisite XML::LibXML::XPathContext 0 not found.
# --------------------------------------------------------------------------------
# perl Makefile.PL
# make
# make install
# --------------------------------------------------------------------------------
# cpan Readonly
# cpan Class::Acessor
# cpan Bit::Vector
# --------------------------------------------------------------------------------
