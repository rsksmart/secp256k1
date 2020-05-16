echo '------------BUILDING SECP256K1 JNI PROJECT JAR------------' &&\
cd src/java &&\
mvn clean install &&\
echo '------------BUILDED SECP256K1 JNI PROJECT JAR------------' &&\
echo 'checkout src/java/target'