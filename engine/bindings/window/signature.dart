part of '../window_manager.dart';
typedef GLFWInitNative = Int32 Function();
typedef GlfwInit = int Function();

typedef GLFWCreateWindowNative = Pointer<Void> Function(
    Int32 width,
    Int32 height,
    Pointer<Utf8> title,
    Pointer<Void> monitor,
    Pointer<Void> share);
typedef GlfwCreateWindow = Pointer<Void> Function(int width, int height,
    Pointer<Utf8> title, Pointer<Void> monitor, Pointer<Void> share);

typedef GLFWMakeContextCurrentNative = Void Function(Pointer<Void> window);
typedef GlfwMakeContextCurrent = void Function(Pointer<Void> window);

typedef GLFWWindowShouldCloseNative = Int32 Function(Pointer<Void> window);
typedef GlfwWindowShouldClose = int Function(Pointer<Void> window);

typedef GLFWPollEventsNative = Void Function();
typedef GlfwPollEvents = void Function();
typedef GLFWSwapBuffersNative = Void Function(Pointer<Void> window);
typedef GlfwSwapBuffers = void Function(Pointer<Void> window);
typedef FN<T extends Function> = NativeFunction<T>;





// Typedef for the GLFW key callback
typedef GLFWKeyCallbackNative = Void Function(
    Pointer<Void> window, Int32 key, Int32 scancode, Int32 action, Int32 mods);
typedef GLFWKeyCallbackDart = void Function(
    Pointer<Void> window, int key, int scancode, int action, int mods);

// Native function for setting the key callback
typedef GLFWSetKeyCallbackC = Void Function(
    Pointer<Void> window, Pointer<NativeFunction<GLFWKeyCallbackNative>> callback);
typedef GLFWSetKeyCallbackDart = void Function(
    Pointer<Void> window, Pointer<NativeFunction<GLFWKeyCallbackNative>> callback);