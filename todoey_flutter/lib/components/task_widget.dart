import 'package:flutter/material.dart';

import '../models/task.dart';

class TaskWidget extends StatefulWidget {
  final Task task;
  final VoidCallback onPressed2;
  final Task target;
  const TaskWidget(
      {Key? key,
      required this.task,
      required this.onPressed2,
      required this.target})
      : super(key: key);

  @override
  _TaskWidgetState createState() => _TaskWidgetState();
}

class _TaskWidgetState extends State<TaskWidget> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        widget.task.lineText,
        style: TextStyle(
            decoration:
                widget.task.isDone() ? TextDecoration.lineThrough : null),
      ),
      trailing: Checkbox(
        activeColor: Colors.lightBlueAccent,
        value: widget.task.isDone(),
        onChanged: (bool? value) {
          setState(() {
            widget.task.changeValue();
          });
        },
      ),
      onLongPress: () {
        widget.target.changeString(widget.task.lineText);
        widget.onPressed2();
      },
    );
  }
}
