# Overview

This is a fork of the secp256k1 library, with a few modifications to the JNI bindings (the rest of the code is not and should not be modified).

Modifications are:
- use Maven to build JNI bindings
- implement missing "parse pubkey" method, which can be used to check that a public key is valid, and to decompress a public key
- add a new method that returns signature in compact format
- make verify handle both DER and compact signatures
- add a new method to add 2 public keys
- embed native libraries into the JAR file

JNI native libraries are embedded into the JAR file. A custom loader will extract and load native bindings for your operating system
in a temporary directory. If this process fails it will fallback to BouncyCastle.

JNI libraries are included for:
- Linux 64 bits
- Windows 64 bits
- Osx 64 bits

You can use your own library native library by specifying its path with `-Dfr.acinq.secp256k1.lib.path` and optionally its name with `-Dfr.acinq.secp256k1.lib.name` (if unspecified
bitcoin-lib will use the standard name for your OS i.e. libsecp256k1.so on Linux, secp256k1.dll on Windows, ...)

You can also specify the temporary directory where the library will be extracted with `-Djava.io.tmpdir` or `-Dfr.acinq.secp256k1.tmpdir` (if you want to use a different
directory from `-Djava.io.tmpdir`).

# Building

## JNI Bindings

JNI bindings are built on Linux, using docker for Windows and Osx libraries.

To build Linux native libraries:
```
$ ./autogen.sh && ./configure --enable-module-recovery --enable-experimental --enable-module_ecdh --enable-jni && make clean && make
```

To build Windows native libraries:
```
$ ./docker/dockcross-windows-x64 -a --rm bash -c './autogen.sh && JAVA_HOME=`pwd`/src/java/jniheaders ./configure --host=x86_64-w64-mingw32 --enable-experimental --enable-module_ecdh --enable-jni --enable-module-recovery && make clean && make'
```

To build oxs native libraries:
```
$ docker run -it --rm -v $(pwd):/workdir -e CROSS_TRIPLE=x86_64-apple-darwin  multiarch/crossbuild ./build_mac_inside.sh
```

## Java library

Once you've built native bindings you can build and package the Java library with:
```
$ mvn install
```
