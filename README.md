# centos-python-rpm

This script will compile the latest v2 Python `v2.7.11` from source and package as an RPM.

## Installation

The simplest way to get up and running is to execute `./build.sh`. 

This will build an RPM called `python-latest-2.7.11-1.x86_64.rpm`. You can then install it via `yum` or `rpm`.

The contents of the RPM will install to `/usr/local/` and will not effect the system version of Python.

Run Python via `/usr/local/bin/python`

### Requirements

To compile Python and package it some dependencies are needed, these are automatically installed however for reference:

`'development tools' zlib-devel bzip2 bzip2-devel readline-devel sqlite sqlite-devel openssl-devel gem ruby-devel gem(fpm)`
