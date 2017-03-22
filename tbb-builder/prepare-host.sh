#!/bin/bash
sudo apt-get update

# install docker repository key
sudo apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv- keys 58118E89F3A912897C070ADBF76221572C52609D

# install and run 'apt-add-repository'
sudo apt-get install -y software-properties-common python-software-properties
sudo apt-add-repository 'deb https://apt.dockerproject.org/repo ubuntu-xenial main'
sudo apt-get update

# use docker-engine repository as default
apt-cache policy docker-engine

# install docker
sudo apt-get install -y docker-engine

# add root to docker group
sudo usermod -aG docker root

# add current user to docker group (except if we are root)
test $(whoami) = root || sudo usermod -aG docker $(whoami)

# install required packages
apt-get install -y make libyaml-libyaml-perl libtemplate-perl libio-handle-util-perl libio-all-perl libio-captureoutput-perl libfile-slurp-perl libstring-shellquote-perl libsort-versions-perl libdigest-sha-perl libdata-uuid-perl libdata-dump-perl libfile-copy-recursive-perl git 

mkdir -p /var/src
cd /var/src
# clone torbrowser repository
git clone https://git.torproject.org/builders/tor-browser-build.git
cd tor-browser-build

echo "Run 'make <channel>' to start build, where <channel> is:"
echo "    release"
echo "    nightly"
echo "    alpha"
echo "    alpha-nightly"
echo
echo To switch off rbm debugging, run 'export RBM_NO_DEBUG=1'

exec /bin/bash -l
