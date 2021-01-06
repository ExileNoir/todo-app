import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/models/task_data.dart';

/* declared here so taskTitle value does not return null when keyboard switches ON/OFF*/
String taskTitle;

class AddTaskScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: MediaQuery.of(context).viewInsets.bottom != 0
          ? Color(0xFF0A0E21)
          : Color(0xFF757575),
      child: Container(
        padding: EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Add Task',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 30.0,
                color: Color(0xFF0A0E21),
              ),
            ),
            TextField(
              autofocus: true,
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                hintText: 'Add a Task',
              ),
              onChanged: (inputTask) {
                taskTitle = inputTask;
              },
            ),
            FlatButton(
              onPressed: () {
                Provider.of<TaskData>(context, listen: false)
                    .addTask(taskTitle ?? 'Hail Lord noir');
                Navigator.pop(context);
              },
              child: Text(
                'Add',
                style: TextStyle(
                  color: Color(0xFFEB1555),
                ),
              ),
              color: Color(0xFF0A0E21),
            ),
          ],
        ),
      ),
    );
  }
}
