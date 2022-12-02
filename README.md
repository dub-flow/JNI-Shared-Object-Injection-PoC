# JNI-Shared-Object-Injection-PoC
This repo contains a PoC for how an attacker might be able to inject a `malicious shared object` into a `Java` application using the `Java Native Interface` (`JNI`) to execute native code (in our scenario, `C++`). 

Our dummy `Java` application loads a native library like this: `System.loadLibrary("somestuff")` (which loads a library called `libsomestuff.so`). Loading a library this way makes the application vulnerable to `CWE 114 - Process Control`. 

On Linux, `JNI` finds native shared object libraries in the directories specified in `LD_LIBRARY_PATH` and `java.library.path`, but there might also be other sources of potential directories, such as `sun.java.library.path`. Consequently, it's complex to know from where exactly a library may be loaded from. 

If `any` of the paths has too loose permissions, a malicious low-privileged user might be able to `escalate privileges`. To achieve this, he would put a malicious `libsomestuff.so` higher up the path and wait for e.g. `root` to execute the `Java` application. Once `root` runs the `Java` app, it would lead to the malicious version of `libsomestuff.so` being executed instead of the intended one - in the name of the user running our `Java` app. Consequently, our malicious user run arbitrary commands as the other user running the `Java` app.

To limit the risk, I would recommend using `System.load("/absolute/path/to/lib/somestuff.so")`.

### How to setup and run

* We included a `setup.sh` which will compile everything and then run `LoadLibraryTest.java`
* Simply run `export JAVA_PATH=<path_to_Java> && ./setup.sh`
    - To find the appropriate `JAVA_PATH`, I'd recommend running a `locate jni.h`
    - If the result is e.g. `/usr/lib/jvm/java-11-openjdk-arm64/include/jni.h`, then you want to use everything before the `/include` (i.e. `/usr/lib/jvm/java-11-openjdk-arm64/`)
        - For folks that have their environment better set up than me, simply using `JAVA_HOME` as `JAVA_PATH` might do the job already?
