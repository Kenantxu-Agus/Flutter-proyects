import 'package:flutter/material.dart';
import 'package:todoey_flutter/components/task_widget.dart';

import '../models/task.dart';

class TaskListView extends StatelessWidget {
  final List<Task> tasks;
  final VoidCallback onPressed2;
  final Task target;

  const TaskListView(
      {Key? key,
      required this.tasks,
      required this.onPressed2,
      required this.target})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: generateTasksWidget(),
    );
  }

  List<TaskWidget> generateTasksWidget() {
    List<TaskWidget> customList = [];
    for (Task task in tasks) {
      TaskWidget taskView = TaskWidget(
        task: task,
        onPressed2: onPressed2,
        target: target,
      );
      customList.add(taskView);
    }
    return customList;
  }
}
