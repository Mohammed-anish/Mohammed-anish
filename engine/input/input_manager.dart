part of '../bin/event/event_manager.dart';

///TODO: this will manage blueprint for all the type of inputs
abstract class InputEvent implements Event {}

class Input {
  static final Keyboard keyboard = Keyboard();
}

class Keyboard {
  late final bool initialized;

  final Map<int, Map<String, int>> _keyEvents = {};
  final Set _specialKeyInput = {};

  void _registerEventProvider(
      Pointer<Void> window, int key, int scancode, int action, int mods) {
    // print('sc:$scancode');

    _keyEvents[key] = {'act': action, 'k': key, 'md': mods};
  }

  // bool getKeyAnd(int normalKey, int modifiers) {
  //   return _pressedNormalKeys.contains(normalKey) &&
  //       (_activeKeys & modifiers) == modifiers;
  // }

  bool getKey(int keycode) {
    // Check if the key is registered and if its action indicates it is pressed
    return _keyEvents[keycode]?['act'] == 1;
  }

  bool getLongpress(int keycode) {
    // Check if the key is registered and if its action indicates it is pressed
    return _keyEvents[keycode]?['act'] == 2;
  }

  bool getKeyCombination(int keycode, List<int> modifiers) {
    final Map<String, int>? keyEvent = _keyEvents[keycode];

    if (keyEvent != null) {
      int action = keyEvent['act'] ?? 0;
      int mods = keyEvent['md'] ?? 0;
      return (action == 1 || action == 2) &&
          modifiers.reduce(
                (value, element) => value + element,
              ) ==
              mods;
    }

    ///TODO: temp comment
    // Check if the key is pressed and if the modifier matches
    // final keyEvent = _keyEvents[keycode];
    // if (keyEvent != null) {
    //   final action = keyEvent['act'];
    //   final mods = keyEvent['md']!;

    //   // Check if the action indicates the key is pressed and if the modifier matches
    //   return action == 1 && (mods & modifiers) == modifiers;
    // }
    return false;
  }
}
