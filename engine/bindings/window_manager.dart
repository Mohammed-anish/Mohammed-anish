import 'dart:ffi';
import 'dart:io';

import 'package:ffi/ffi.dart';
import 'package:velvet/engine/bindings/opengl.dart';

part './window/binding.dart';
part './window/signature.dart';

class WindowManager extends NativeGLFWBindings {
  bool _initialized = false;
  Pointer<Void>? window;

  void init() {
    if (_glfwInit() == 0) {
      _initialized = false;
      throw Exception('Error during intialization of window: See [init]');
    } else {
      print('[$runtimeType] Initialized');
      _initialized = true;
    }
  }

  void createWindow({
    required String title,
    required int width,
    required int height,
    Function()? onStart,
    Function()? onUpdate,
    bool? useOpenGLContext,
  }) {
    if (!_initialized) {
      return;
    }
    window = _glfwCreateWindow(
        width, height, title.toNativeUtf8(), nullptr, nullptr);
    if (window == nullptr) {
      calloc.free(window!);
      throw Exception("Failed to create GLFW window");
    }

    if (useOpenGLContext == true) {
      _glfwMakeContextCurrent(window!);
      // print(_opengl.providesSymbol('dd'));
    }
    print('[$runtimeType] window created');
    // Check();
    onStart?.call();
    // print(opengl);
    while (_glfwWindowShouldClose(window!) == 0) {
      onUpdate?.call();

      _glfwSwapBuffers(window!);
      _glfwPollEvents();
    }
    // calloc.free(vc);
    calloc.free(window!);
  }

  static Function(int key, int action, int mods)? onKey;
  static setKeyboardListener(
      Pointer<Void> window, int key, int scancode, int action, int mods) {
    // print('Scancode for $scancode $key ${0x2A}');
    print('mods $mods');
    WindowManager.onKey?.call(key, action, mods);
  }

  void initKeyboardListener() {
    glfwSetKeyCallback(
        window!,
        Pointer.fromFunction<GLFWKeyCallbackNative>(
            WindowManager.setKeyboardListener));
  }
}
