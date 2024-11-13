import 'dart:ffi';
import 'dart:io';

import 'package:ffi/ffi.dart';

part './opengl/binding.dart';
part './opengl/signature.dart';

class OpenGl extends OpenGLBinding {
  // const OpenGl();
  void clearBuffer(int buffer) {
    glClear(buffer);
  }

  void clearColor(double r, double g, double b, double a) {
    glClearColor(r / 255, g / 255, b / 255, a / 255);
  }

  void enable(int cap) {
    glEnable(cap);
  }

  void color3F(double r, double g, double b) {
    glColor3F(r, g, b);
  }

  void colorFromHex(String hex) {
    if (hex.startsWith('#')) {
      hex = hex.substring(1);
    }

    int r = int.parse(hex.substring(0, 2), radix: 16);
    int g = int.parse(hex.substring(2, 4), radix: 16);
    int b = int.parse(hex.substring(4, 6), radix: 16);

    color3FV([r / 255.0, g / 255.0, b / 255.0]);
  }

  void color3FV(List<double> array) {
    Pointer<Float> nativeArray = doubleToArray(array);
    glColor3fv(nativeArray);
  }

  Pointer<Int32> intListToArray(List<int> list) {
    final ptr = malloc.allocate<Int32>(sizeOf<Int32>() * list.length);
    for (int i = 0; i < list.length; i++) {
      ptr + list[i];
    }
    return ptr;
  }

  Pointer<Float> doubleToArray(List<double> list) {
    final ptr = calloc<Float>(list.length);

    for (var i = 0; i < list.length; i++) {
      ptr.elementAt(i).value = list[i];
    }

    return ptr; // Return the pointer to the allocated memory
  }

  // drawTra() {
  //   glBegin(0x0004); // Begin defining a triangle

  //   // Specify the vertices of the triangle
  //   glVertex3f(0.0, 1.0, 0.0); // Vertex 1
  //   glVertex3f(-1.0, -1.0, 0.0); // Vertex 2
  //   glVertex3f(1.0, -1.0, 0.0); // Vertex 3
  //   glVertex3f(0.0, -4.0, 0.0); // Vertex 3

  //   glEnd(); // End the t
  // }
}
