part of '../window_manager.dart';

// Load the appropriate GLFW library depending on the platform (Windows or Linux).
final DynamicLibrary glfw = Platform.isWindows
    ? DynamicLibrary.open(
        '${Directory.current.path}\\core\\glfw3.dll') // On Windows, use glfw3.dll.
    : DynamicLibrary.open('libglfw.so'); // On Linux, use libglfw.so.

/// Sealed class to contain GLFW FFI bindings.
sealed class NativeGLFWBindings {
  // Internal method to lookup a symbol in the loaded GLFW library.
  // It returns a pointer to the native function.
  static Pointer<T> _lookup<T extends NativeType>(String symballName) {
    return glfw.lookup<T>(symballName);
  }

  /// Binding for `glfwInit()`, the function that initializes the GLFW library.
  /// This must be called before any other GLFW functions can be used.
  final GlfwInit _glfwInit =
      _lookup<FN<GLFWInitNative>>('glfwInit').asFunction();

  /// Binding for `glfwCreateWindow()`, used to create a window and its OpenGL context.
  /// Parameters include window width, height, title, monitor, and share context.
  final GlfwCreateWindow _glfwCreateWindow =
      _lookup<FN<GLFWCreateWindowNative>>('glfwCreateWindow').asFunction();

  /// Binding for `glfwMakeContextCurrent()`, used to set the OpenGL context
  /// for the current window, which enables rendering.
  final GlfwMakeContextCurrent _glfwMakeContextCurrent =
      _lookup<FN<GLFWMakeContextCurrentNative>>('glfwMakeContextCurrent')
          .asFunction();

  /// Binding for `glfwWindowShouldClose()`, used to check if the window should close.
  /// It returns a boolean indicating if the user has attempted to close the window.
  final GlfwWindowShouldClose _glfwWindowShouldClose =
      _lookup<FN<GLFWWindowShouldCloseNative>>('glfwWindowShouldClose')
          .asFunction();

  /// Binding for `glfwPollEvents()`, which processes any pending events like
  /// input (keyboard/mouse) or window events without blocking the program.
  /// This function should be called regularly to ensure smooth event handling.
  final GlfwPollEvents _glfwPollEvents =
      _lookup<FN<GLFWPollEventsNative>>('glfwPollEvents').asFunction();

  /// Binding for `glfwSwapBuffers()`, used to swap the front and back buffers
  /// of the specified window. This is essential for displaying rendered content
  /// in double-buffered windows.
  final GlfwSwapBuffers _glfwSwapBuffers =
      _lookup<FN<GLFWSwapBuffersNative>>('glfwSwapBuffers').asFunction();
  final GLFWSetKeyCallbackDart glfwSetKeyCallback =
      glfw.lookupFunction<GLFWSetKeyCallbackC, GLFWSetKeyCallbackDart>(
          'glfwSetKeyCallback');
}
