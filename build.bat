
rmdir /s /q aa
mkdir aa
cd aa
cmake -DCMAKE_TOOLCHAIN_FILE=..\cmake\toolchain-mingw64.cmake -G "MinGW Makefiles" ..
make -j3
cd ..
