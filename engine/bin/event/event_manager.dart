import 'dart:collection';
import 'dart:ffi';

import 'package:velvet/engine/bin/events.dart';
import 'package:velvet/engine/input/key_bindings.dart';

part '../../input/input_manager.dart';

class EventManager {}

class InputEventManager {
  static Pointer<Void>? _window;

  void setCurrentWindow(Pointer<Void> window) {
    _window = window;
  }

  static keyboardInputProvider(int key, int action, int mods) {
    assert(_window != null, 'Window should selected to handle input events');
    Input.keyboard._registerEventProvider(_window!, key, 0, action, mods);
  }
}
