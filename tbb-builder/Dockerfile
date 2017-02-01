FROM ubuntu

MAINTAINER Oliver Meyer "oliver.meyer@jondos.de"

ENV USE_LXC 1
ENV DEBIAN_FRONTEND noninteractive
ENV TBB_BRANCH maint-6.5
ENV TBB_TAG tbb-6.5-build4

RUN apt-get update && apt-get install -y \
	sudo \
        make \
        git \
        torsocks \
        tor \
        ruby \
        apache2 \
        apt-cacher-ng \
        qemu-kvm \
        virt-what \
        lxc \
        lxctl \
        fakeroot \
        faketime \
        zip \
        unzip \
        subversion \
        debian-archive-keyring \
        python-vm-builder \
        libyaml-perl \
        libfile-slurp-perl \
        libxml-writer-perl \
        libio-captureoutput-perl \
        libparallel-forkmanager-perl \
        libxml-libxml-perl \
        libjson-perl \
	curl \
	pkg-config \
	libgtk2.0-dev \
	libglib2.0-dev

RUN mkdir /var/src

VOLUME /var/src

ADD tbb-build.sh /root/tbb-build.sh

RUN chmod +x /root/tbb-build.sh

ENTRYPOINT /root/tbb-build.sh
