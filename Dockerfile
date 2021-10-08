FROM resin/armv7hf-debian

ENV VERSION=7.0.2

RUN [ "cross-build-start" ]

RUN apt-get update -y 
RUN DEBIAN_FRONTEND="noninteractive" apt-get -y install tzdata

RUN apt-get install -y \
    sudo \
    libzmq3-dev \
    libpcsclite-dev \
    libboost1.67-* \
    libunwind8-dev \
    libssl-dev \ 
    libunbound-dev \ 
    libminiupnpc-dev \
    liblzma-dev \ 
    libldns-dev \
    libexpat1-dev \
    libprotobuf-dev

RUN cd /usr/lib/arm-linux-gnueabihf/ && sudo ln -sv libreadline.so.8.0 libreadline.so.7

ARG USER=docker
ENV HOME /home/$USER

RUN adduser --disabled-password --gecos '' $USER
RUN adduser $USER sudo
RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

USER docker

USER $USER
WORKDIR $HOME
 
RUN  sudo mkdir /data

ADD ./safexd-arm-$VERSION ./safexd-arm-$VERSION
RUN sudo chmod +x safexd-arm-$VERSION

EXPOSE 17400-17403/tcp

LABEL author="Safex.Ninja"
LABEL core-version=$VERSION
LABEL description="Running Safex Core Node"
LABEL info="See https://github.com/safex/safexcore/"

CMD sudo ./safexd-arm-$VERSION --in-peers=50 --out-peers=50 --data-dir=/data
RUN [ "cross-build-end" ]