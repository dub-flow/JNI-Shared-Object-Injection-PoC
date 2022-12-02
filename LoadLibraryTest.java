public class LoadLibraryTest {  
    static {
        String libname = "somestuff";
        System.loadLibrary(libname);
    }
    
    public static void main(String[] args) {
        System.out.println("Hello from Java!");
        new LoadLibraryTest().sayHello();
    }

    // Declare a native method sayHello() that receives no arguments and returns void
    private native void sayHello();
}
