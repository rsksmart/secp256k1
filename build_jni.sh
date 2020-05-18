echo '------------BUILDING BINARIES & JNI PROJECT------------' 
echo '------------BUILDING BINARIES------------' 
echo '------------BUILDING LINUX BINARY------------' 
./build_linux.sh 
echo '------------BUILDED LINUX BINARY------------' 
echo '------------UPDATING LINUX BINARY------------' 
cp .libs/libsecp256k1.so.0.0.0 src/java/src/main/resources/fr/acinq/native/Linux/x86_64 &&
rm -f libsecp256k1.so &&
mv src/java/src/main/resources/fr/acinq/native/Linux/x86_64/libsecp256k1.so.0.0.0 src/java/src/main/resources/fr/acinq/native/Linux/x86_64/libsecp256k1.so &&
echo '------------UPDATED LINUX BINARY------------' 
echo '------------BUILDING MAC BINARY------------' 
./build_mac.sh
echo '------------BUILDED MAC BINARY------------' 
echo '------------UPDATING MAC BINARY------------' 
cp .libs/libsecp256k1.0.dylib src/java/src/main/resources/fr/acinq/native/Mac/x86_64 &&
rm -f libsecp256k1.jnilib &&
mv src/java/src/main/resources/fr/acinq/native/Mac/x86_64/libsecp256k1.0.dylib src/java/src/main/resources/fr/acinq/native/Mac/x86_64/libsecp256k1.jnilib 
echo '------------UPDATED MAC BINARY------------' 
echo '------------BUILDING WINDOWS BINARY------------' 
./build_win.sh 
echo '------------BUILDED WINDOWS BINARY------------' 
echo '------------UPDATING WINDOWS BINARY------------' 
cp .libs/libsecp256k1-0.dll src/java/src/main/resources/fr/acinq/native/Windows/x86_64 &&
rm -f secp256k1.dll &&
mv src/java/src/main/resources/fr/acinq/native/Windows/x86_64/libsecp256k1-0.dll src/java/src/main/resources/fr/acinq/native/Windows/x86_64/secp256k1.dll
echo '------------UPDATED WINDOWS BINARY------------' 
echo '------------BUILDED BINARIES SUCCESSFULLY------------' 
echo '------------BUILDING SECP256K1 JNI PROJECT JAR------------' 
cd src/java 
mvn clean install 
echo '------------BUILDED SECP256K1 JNI PROJECT JAR------------' 
echo 'checkout src/java/target' 
echo '------------BUILDED BINARIES & JNI PROJECT------------'