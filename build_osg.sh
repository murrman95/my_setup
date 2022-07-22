#!/bin/bash

git clone https://github.com/openscenegraph/osg

cd osg
git checkout tags/OpenSceneGraph-3.4.1

mkdir build
cd build
cmake ..
make -j8
sudo make install

cd $HOME
