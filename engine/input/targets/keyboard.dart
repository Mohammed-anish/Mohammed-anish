import 'package:velvet/engine/bin/event/event_manager.dart';
import 'package:velvet/engine/input/inp_parameters/keybord_prm.dart';

class KeyboardInput extends InputEvent {
  @override
  void handle(covariant KeyboardParameters inp) {
    print('management of inp $inp');
  }
}
