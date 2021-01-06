import 'dart:collection';

import 'package:flutter/foundation.dart';
import 'package:todo/models/task.dart';

class TaskData extends ChangeNotifier {
  final List<Task> _tasks = [
    Task(name: 'Learn Coding'),
    Task(name: 'Buy Food'),
    Task(name: 'Buy Beer'),
  ];

  int get taskCount {
    return _tasks.length;
  }

  UnmodifiableListView<Task> get tasks {
    return UnmodifiableListView(_tasks);
  }

  void addTask(final String taskTitle) {
    final Task task = Task(name: taskTitle);
    _tasks.add(task);
    notifyListeners();
  }

  void updateTask(final Task task) {
    task.toggleDone();
    notifyListeners();
  }

  void deleteTask(final Task task) {
    _tasks.remove(task);
    notifyListeners();
  }
}
