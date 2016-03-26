#!/bin/bash

# Build vars
WORKING_DIR=/tmp/python_build
PACKAGE_DIR=/tmp/python_package
PYTHON_DIR="Python-2.7.11"
PYTHON_TAR="https://www.python.org/ftp/python/2.7.11/Python-2.7.11.tgz"
BIN_DIR=`pwd`

# Version info
RPM_PACKAGE_NAME="python-latest"
RPM_PACKAGE_VERSION="2.7.11"

echo "Installing deps"
sudo yum -y groupinstall -y 'development tools'
sudo yum -y install zlib-devel bzip2 bzip2-devel readline-devel sqlite sqlite-devel openssl-devel gem ruby-devel
sudo gem install fpm

echo "Creating build dirs"
mkdir -p $WORKING_DIR
mkdir -p $PACKAGE_DIR

echo "Grabbing Python"
curl $PYTHON_TAR | tar xvz -C $WORKING_DIR

echo "Moving to Python working dir"
cd $WORKING_DIR/$PYTHON_DIR

echo "Configure Python source"
./configure --enable-unicode=ucs4

echo "Make Python source"
make

echo "Install Python binary to packaging dir"
make altinstall DESTDIR=$PACKAGE_DIR

echo "Packaging Python as RPM via fpm"
fpm -s dir -t rpm -n $RPM_PACKAGE_NAME -v $RPM_PACKAGE_VERSION -C $PACKAGE_DIR -p $BIN_DIR

echo "Cleanup build dirs"
rm -rf /tmp/python_*
