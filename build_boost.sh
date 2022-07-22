#!/bin/bash

wget -O boost_1_62_0.tar.gz https://sourceforge.net/projects/boost/files/boost/1.62.0/boost_1_62_0.tar.gz/download
tar xzvf boost_1_62_0.tar.gz
cd boost_1_62_0/

sudo apt-get update
sudo apt-get install build-essential g++ python-dev autotools-dev libicu-dev libbz2-dev

./bootstrap.sh --prefix=/usr/local

user_configFile=`find $PWD -name user-config.jam`
echo "using mpi ;" >> $user_configFile

n=`cat /proc/cpuinfo | grep "cpu cores" | uniq | awk '{print $NF}'`

sudo ./b2 --with=all -j $n install

sudo sh -c 'echo "/usr/local/lib" >> /etc/ld.so.conf.d/local.conf'

sudo ldconfig

cd $HOME
