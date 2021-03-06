#!/bin/sh

mkdir -p 8bit 10bit

cd 10bit
cmake -G "MSYS Makefiles" ../../../source -DHIGH_BIT_DEPTH=ON -DEXPORT_C_API=OFF -DENABLE_SHARED=OFF -DENABLE_CLI=OFF
make
cp libx265.a ../8bit/libx265_main10.a

cd ../8bit
cmake -G "MSYS Makefiles" ../../../source -DEXPORT_C_API=OFF -DENABLE_SHARED=OFF -DENABLE_CLI=ON -DEXTRA_LIB=x265_main10.a -DEXTRA_LINK_FLAGS=-L.
make
