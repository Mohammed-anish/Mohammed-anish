import 'dart:ffi';

import 'package:velvet/engine/input/inp_parameters/inp_parameter.dart';

//Not in use
class KeyboardParameters extends InputParameter {
  final Pointer<Void> window;
  final int key;
  final int scancode;
  final int action;
  final int mods;
  KeyboardParameters(
      this.window, this.key, this.scancode, this.action, this.mods);
}
