@echo off

set path=C:\MinGW\bin\;C:\MinGW\msys\1.0\bin;C:\gnuwin32\bin;C:\mingw32\i686-w64-mingw32\bin;C:\mingw32\bin;%path%
FOR /F "delims=" %%d IN ('pwd.exe') DO (set root=%%d)

SET boost_libdir="%root%/packages/boost/stage/lib/"
SET LDFLAGS="-L%root%/packages/berkeleydb/lib/ -L%boost_libdir% -L%root%/packages/openssl/lib/ -L%root%/bitcoin/src/leveldb/"
SET CPPFLAGS="-I%root%/packages/berkeleydb/include/ -I%root%/packages/boost/ -I%root%/packages/openssl/include/ -I%root%/bitcoin/src/leveldb/include/"

PUSHD bitcoin

if not exist "Makefile" perl configure LDFLAGS=%LDFLAGS% CPPFLAGS=%CPPFLAGS% --with-boost-libdir=%boost_libdir% --disable-wallet
make

POPD
