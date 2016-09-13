#! /bin/bash
./configure CFLAGS="-mmacosx-version-min=10.7" LDFLAGS="-mmacosx-version-min=10.7" CXXFLAGS="-mmacosx-version-min=10.7 -std=c++11 -stdlib=libc++"
make
make install DESTDIR=$PWD/build
