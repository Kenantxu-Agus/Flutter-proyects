import 'package:flutter/material.dart';
import 'package:todoey_flutter/components/modal_bottom.dart';
import 'package:todoey_flutter/components/tasks_listview.dart';
import 'package:todoey_flutter/view_models/task_view_model.dart';

import '../models/task.dart';

class TaskScreen extends StatefulWidget {
  @override
  _TaskScreenState createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  TaskViewModel viewModel = TaskViewModel();
  Task target = Task('a');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.lightBlueAccent,
        child: Icon(Icons.add),
        onPressed: () {
          showModalBottomSheet(
              context: context,
              builder: (context) => AddBottom(
                    onPressed: () {
                      setState(() {
                        viewModel.addTask(Task(viewModel.taskTitle));
                        Navigator.pop(context);
                      });
                    },
                    onChanged: (String value) {
                      viewModel.taskTitle = value;
                    },
                  ));
        },
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.only(top: 60.0, left: 30.0, right: 30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 30.0,
                  child: Icon(
                    Icons.list,
                    size: 30.0,
                    color: Colors.lightBlueAccent,
                  ),
                ),
                SizedBox(height: 10.0),
                Text(
                  'Todoey',
                  style: TextStyle(
                    fontSize: 50.0,
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  '${viewModel.getNumberOfTasks()} Tasks',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                  ),
                ),
                SizedBox(height: 6.0),
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(20.0),
                  topLeft: Radius.circular(20.0),
                ),
              ),
              child: TaskListView(
                tasks: viewModel.getMyTasks(),
                target: target,
                onPressed2: () {
                  setState(() {
                    viewModel.removeTask(target);
                  });
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
