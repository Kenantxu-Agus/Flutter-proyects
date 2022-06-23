import 'package:flutter/cupertino.dart';

class Task extends ChangeNotifier {
  bool _completed = false;
  late String lineText;

  Task(this.lineText);

  void changeValue() {
    _completed = !_completed;
  }

  bool isDone() {
    return _completed;
  }

  void changeString(String newText) {
    lineText = newText;
  }
}
