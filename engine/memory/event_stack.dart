import 'dart:collection';

import '../bin/events.dart';

///TODO: implement to make record of events all type of events
abstract class EvId {
  // final String _value;
 
}

class EventStack {
  final List<HashMap<EvId, Event>> _eventStackTrackList = [];
}

EventStack eventStack = EventStack();
