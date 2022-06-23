import '../models/task.dart';

class TaskViewModel {
  final List<Task> _myTasks = [];
  String taskTitle = '';

  void addTask(Task task) {
    _myTasks.add(task);
  }

  void removeTask(Task target) {
    final index =
        _myTasks.indexWhere((task) => task.lineText == target.lineText);
    if (index >= 0) {
      _myTasks.remove(_myTasks[index]);
    }
  }

  int getNumberOfTasks() {
    return _myTasks.length;
  }

  List<Task> getMyTasks() {
    return _myTasks;
  }
}
