#!/bin/bash

# compile the `LoadLibraryTest.java` file to get the corresponding `.h` file (`LoadLibraryTest.h`)
javac -h . LoadLibraryTest.java

# rename `LoadLibraryTest.h` to `malicious.h` and move into the `./payload` folder
rm -f payload/malicious.h
mv LoadLibraryTest.h payload/malicious.h

# compile `malicious.cpp`
g++ -c -fPIC -I${JAVA_PATH}/include -I${JAVA_PATH}/include/linux payload/malicious.cpp -o payload/malicious.o

# include the compiled binary into a new `.so` file
g++ -shared -fPIC -o libsomestuff.so payload/malicious.o -lc

# compile the Java binary
javac LoadLibraryTest.java

# run the Java binary
export LD_LIBRARY_PATH=.
#java -Djava.library.path=. LoadLibraryTest
java LoadLibraryTest