#! /bin/bash

# Build glog for Android
# Philip Lamb philip.lamb@daqri.com
# June 2016.

# Get our location.
OURDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Use the standard path to the Android NDK.
if [ -z "${ANDROID_NDK}" ]; then
    if [ -z "${ANDROID_NDK_ROOT}" ]; then
        echo "Need to set ANDROID_NDK or ANDROID_NDK_ROOT"
        exit 1
    fi
    export ANDROID_NDK=${ANDROID_NDK_ROOT}
fi

if [ ! -d "build-android-armeabi" ] ; then
	mkdir build-android-armeabi
fi
cd build-android-armeabi
rm -f CMakeCache.txt
cmake .. -DWITH_GFLAGS:BOOL=OFF -DCMAKE_BUILD_TYPE=Release -DCMAKE_TOOLCHAIN_FILE=cmake/android.toolchain.cmake -DANDROID_NATIVE_API_LEVEL=android-15 -DANDROID_ABI="armeabi" -DANDROID_TOOLCHAIN_NAME=arm-linux-androideabi-clang -DANDROID_STL=c++_shared -DCMAKE_INSTALL_PREFIX=${PWD}/install
make
make install
cd ..

if [ ! -d "build-android-armeabi-v7a" ] ; then
	mkdir build-android-armeabi-v7a
fi
cd build-android-armeabi-v7a
rm -f CMakeCache.txt
cmake .. -DWITH_GFLAGS:BOOL=OFF -DCMAKE_BUILD_TYPE=Release -DCMAKE_TOOLCHAIN_FILE=cmake/android.toolchain.cmake -DANDROID_NATIVE_API_LEVEL=android-15 -DANDROID_ABI="armeabi-v7a" -DANDROID_TOOLCHAIN_NAME=arm-linux-androideabi-clang -DANDROID_STL=c++_shared -DCMAKE_INSTALL_PREFIX=${PWD}/install
make
make install
cd ..

if [ ! -d "build-android-x86" ] ; then
	mkdir build-android-x86
fi
cd build-android-x86
rm -f CMakeCache.txt
cmake .. -DWITH_GFLAGS:BOOL=OFF -DCMAKE_BUILD_TYPE=Release -DCMAKE_TOOLCHAIN_FILE=cmake/android.toolchain.cmake -DANDROID_NATIVE_API_LEVEL=android-15 -DANDROID_ABI="x86" -DANDROID_TOOLCHAIN_NAME=x86-clang -DANDROID_STL=c++_shared -DCMAKE_INSTALL_PREFIX=${PWD}/install
make 
make install
cd ..

if [ ! -d "build-android-mips" ] ; then
	mkdir build-android-mips
fi
cd build-android-mips
rm -f CMakeCache.txt
cmake .. -DWITH_GFLAGS:BOOL=OFF -DCMAKE_BUILD_TYPE=Release -DCMAKE_TOOLCHAIN_FILE=cmake/android.toolchain.cmake -DANDROID_NATIVE_API_LEVEL=android-15 -DANDROID_ABI="mips" -DANDROID_TOOLCHAIN_NAME=mipsel-linux-android-clang -DANDROID_STL=c++_shared -DCMAKE_INSTALL_PREFIX=${PWD}/install
make
make install
cd ..

if [ ! -d "build-android-arm64-v8a" ] ; then
	mkdir build-android-arm64-v8a
fi
cd build-android-arm64-v8a
rm -f CMakeCache.txt
cmake .. -DWITH_GFLAGS:BOOL=OFF -DCMAKE_BUILD_TYPE=Release -DCMAKE_TOOLCHAIN_FILE=cmake/android.toolchain.cmake -DANDROID_NATIVE_API_LEVEL=android-21 -DANDROID_ABI="arm64-v8a" -DANDROID_TOOLCHAIN_NAME=aarch64-linux-android-clang -DANDROID_STL=c++_shared -DCMAKE_INSTALL_PREFIX=${PWD}/install
make
make install
cd ..

if [ ! -d "build-android-x86_64" ] ; then
	mkdir build-android-x86_64
fi
cd build-android-x86_64
rm -f CMakeCache.txt
cmake .. -DWITH_GFLAGS:BOOL=OFF -DCMAKE_BUILD_TYPE=Release -DCMAKE_TOOLCHAIN_FILE=cmake/android.toolchain.cmake -DANDROID_NATIVE_API_LEVEL=android-21 -DANDROID_ABI="x86_64" -DANDROID_TOOLCHAIN_NAME=x86_64-clang -DANDROID_STL=c++_shared -DCMAKE_INSTALL_PREFIX=${PWD}/install
make
make install
cd ..

if [ ! -d "build-android-mips64" ] ; then
	mkdir build-android-mips64
fi
cd build-android-mips64
rm -f CMakeCache.txt
cmake .. -DWITH_GFLAGS:BOOL=OFF -DCMAKE_BUILD_TYPE=Release -DCMAKE_TOOLCHAIN_FILE=cmake/android.toolchain.cmake -DANDROID_NATIVE_API_LEVEL=android-21 -DANDROID_ABI="mips64" -DANDROID_TOOLCHAIN_NAME=mips64el-linux-android-clang -DANDROID_STL=c++_shared -DCMAKE_INSTALL_PREFIX=${PWD}/install
make
make install
cd ..

