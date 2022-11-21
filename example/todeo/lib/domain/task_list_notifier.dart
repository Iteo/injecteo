import 'dart:async';

import 'package:injecteo/injecteo.dart';

@LazySingleton()
class TaskListChangeNotifier {
  final StreamController<String> _streamController = StreamController.broadcast();

  void notify(String action) => _streamController.sink.add(action);

  Stream<String> getStream() => _streamController.stream;
}
