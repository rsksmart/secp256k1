echo '------------BUILDING BINARIES------------' &&\

echo '------------BUILDING MAC BINARY------------' &&\
chmod u+x build_mac.sh &&\
./build_mac.sh &&\
echo '------------BUILDED MAC BINARY------------' &&\
echo '------------UPDATING MAC BINARY------------' &&\
cp .libs/libsecp256k1.0.dylib src/java/src/main/resources/fr/acinq/native/Mac/x86_64 &&\
rm -f libsecp256k1.jnilib &&\
mv src/java/src/main/resources/fr/acinq/native/Mac/x86_64/libsecp256k1.0.dylib src/java/src/main/resources/fr/acinq/native/Mac/x86_64/libsecp256k1.jnilib &&
echo '------------UPDATED MAC BINARY------------' &&\

echo '------------BUILDING WINDOWS BINARY------------' &&\
chmod u+x build_win.sh &&\
./build_win.sh &&\
echo '------------BUILDED WINDOWS BINARY------------' &&\
echo '------------UPDATING WINDOWS BINARY------------' &&\
cp .libs/libsecp256k1-0.dll src/java/src/main/resources/fr/acinq/native/Windows/x86_64 &&\
rm -f secp256k1.dll &&\
mv src/java/src/main/resources/fr/acinq/native/Windows/x86_64/libsecp256k1-0.dll src/java/src/main/resources/fr/acinq/native/Windows/x86_64/secp256k1.dll &&\
echo '------------UPDATED WINDOWS BINARY------------' &&\

echo '------------BUILDED BINARIES SUCCESSFULLY------------'