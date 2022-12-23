import 'dart:collection';

import 'package:flutter/foundation.dart';
import 'Task.dart';

class TaskData extends ChangeNotifier {
  List<Task> _tasks = [
    Task(name: 'this is task 1', isDone: false),
    Task(name: 'this is task 2, blahblah', isDone: false),
    Task(name: 'this is task 3 ', isDone: false),
  ];

  int get taskCount {
    return _tasks.length;
  }

  UnmodifiableListView<Task> get tasks {
    return UnmodifiableListView(_tasks);
  }

  void addTask(String newTitle) {
    final task =  new Task(name: newTitle, isDone: false);
    _tasks.add(task);
    notifyListeners();
  }

  void updateTasks(Task task) {
      task.toggleDone();
      notifyListeners();
  }

  void deleteTask(Task task) {
    _tasks.remove(task);
    notifyListeners();
  }
}