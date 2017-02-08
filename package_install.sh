#!/bin/bash

if (( $UID != 0 ))
then
   echo "Must use root to run this script!"
   exit 1
fi

# Install epel
yum -y install epel-release
yum -y install synergy

# Install coding related environ ment
yum -y install git gcc gcc-c++ cmake automake
yum -y install python-devel valgrind

# Code check
yum -y install ctags
yum -y install csope

# unix and windows file change
yum -y install unix2dos dos2unix
