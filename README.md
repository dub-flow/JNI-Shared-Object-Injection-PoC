# JNI-Shared-Object-Injection-PoC
This repo contains a PoC for how an attacker might be able to inject a malicious shared object into a Java application using JNI.


## How to setup and run

* We included a `setup.sh` which will compile everything and then run `LoadLibraryTest.java`
* Simply run `export JAVA_PATH=<path_to_Java> && ./setup.sh`
    - To find the appropriate `JAVA_PATH`, I'd recommend running a `locate jni.h`
    - If the result is e.g. `/usr/lib/jvm/java-11-openjdk-arm64/include/jni.h`, then you want to use everything before the `/include` (i.e. `/usr/lib/jvm/java-11-openjdk-arm64/`)
        - For folks that have their environment better set up than me, simply using `JAVA_HOME` as `JAVA_PATH` might do the job already?
