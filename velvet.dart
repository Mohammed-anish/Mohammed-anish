import 'dart:ffi';
import 'dart:io';
import 'dart:math';

import 'package:ffi/ffi.dart';
import 'package:velvet/engine/bin/event/event_manager.dart';
import 'package:velvet/engine/bindings/opengl.dart';
import 'package:velvet/engine/bindings/window_manager.dart';
import 'package:velvet/engine/input/key_bindings.dart';

double angleX = 0.0; // Rotation angle around the X-axis
double angleY = 0.0; //
void main() {
  print('${Directory.current.path}\\core\\glfw3.dll');

  WindowManager windowManager = WindowManager();
  InputEventManager inputEventManager = InputEventManager();
  OpenGl openGl = OpenGl();

  windowManager.init();
  void keyCallback(
      Pointer<Void> window, int key, int scancode, int action, int mods) {
    print('KEy is $key');
  }

  // print(opengl.providesSymbol('glClears'));
  windowManager.createWindow(
    title: 'Velvet Engine',
    width: 800,
    height: 600,
    useOpenGLContext: true,
    onStart: () {
      openGl.enable(GL_DEPTH_TEST);
      inputEventManager.setCurrentWindow(windowManager.window!);
      WindowManager.onKey = (int key, int action, int mods) {
        // print('Mode :$mods and action $action $key ${Key.LeftShift}');
        // print('mds ${mods + key + Key.specialKeyMask} ${Key.LeftShift}');
        // print('key $key');
        InputEventManager.keyboardInputProvider(key, action, mods);
      };
      windowManager.initKeyboardListener();
    },
    onUpdate: () {
      openGl.clearBuffer(colorBufferBit | depthBufferBit);
      // Apply rotation around X-axis
      // openGl.glRotatef(1, 0.00005, 0.0, 0.0); // Convert to degrees
      // Apply rotation around Y-axis

      if (Input.keyboard.getKey(Key.W)) {
        openGl.glRotatef(0.15, 0.00005, 0.0, 0.0);
      }
      if (Input.keyboard.getKey(Key.S)) {
        openGl.glRotatef(-0.15, 0.00005, 0.0, 0.0);
      }

      if (Input.keyboard.getKey(Key.A)) {
        openGl.glRotatef(0.15, 0.0, 0.00005, 0.0);
      }
      if (Input.keyboard.getKey(Key.D)) {
        openGl.glRotatef(0.15, 0.0, -0.00005, 0);
      }
      // if (Input.keyboard.getKeyAnd(Key.A, Key.LeftAlt | Key.LeftShift)) {
      // }
      List<String> hexColors = [
        "#FF0000", // Red
        "#00FF00", // Green
        "#0000FF", // Blue
        "#FFFF00", // Yellow
        "#00FFFF", // Cyan
        "#FF00FF" // Magenta
      ];
      var i = 0;
      for (var face in faces) {
        openGl.glBegin(0x0004);
        // openGl.clearColor(00.2, 255, 0, 255);
        for (int vertexIndex in face) {
          List<double> vertex = vertices[vertexIndex];
          // openGl.color3FV([1, 0.5, 0.7]);
          openGl.colorFromHex(hexColors[i]);

          openGl.glVertex3f(vertex[0], vertex[1], vertex[2]);
        }
        i++;

        openGl.glEnd();
      }
      i = 0;
    },
  );
}

// Define cube vertices and faces
final List<List<double>> vertices = [
  [-0.5, -0.5, -0.5], // Vertex 0
  [0.5, -0.5, -0.5], // Vertex 1
  [0.5, 0.5, -0.5], // Vertex 2
  [-0.5, 0.5, -0.5], // Vertex 3
  [-0.5, -0.5, 0.5], // Vertex 4
  [0.5, -0.5, 0.5], // Vertex 5
  [0.5, 0.5, 0.5], // Vertex 6
  [-0.5, 0.5, 0.5], // Vertex 7
];

final List<List<int>> faces = [
  [0, 1, 2, 2, 3, 0], // Front face
  [4, 5, 6, 6, 7, 4], // Back face
  [0, 1, 5, 5, 4, 0], // Bottom face
  [2, 3, 7, 7, 6, 2], // Top face
  [0, 3, 7, 7, 4, 0], // Left face
  [1, 2, 6, 6, 5, 1], // Right face
];

void drawCube() {}
