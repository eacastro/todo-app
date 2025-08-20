import 'package:flutter/material.dart';
import 'package:flutter_exercises_app/constants/app_constants.dart';
import 'package:flutter_exercises_app/dto/task.dart';

class TaskModel extends ChangeNotifier {
  TaskModel() {
    _initTasks();
  }

  final List<Task> _tasks = [];
  Task? _taskInEdition;

  bool _showEditModal = false;

  List<Task> get tasks => _tasks;
  bool get showEditModal => _showEditModal;
  Task? get taskInEdition => _taskInEdition;

  void add(Task taskToAdd) {
    final taskNotExist =
        _tasks.where((task) => task.name == taskToAdd.name).isEmpty;

    if (taskNotExist) {
      _tasks.add(taskToAdd);
      notifyListeners();
    }
  }

  void _initTasks() {
    _tasks.addAll(AppConstants.tasks);
  }

  void initEdit(Task task) {
    _showEditModal = true;
    _taskInEdition = task;
    notifyListeners();
  }

  void edit(Task task, String newName) {
    if (_tasks.contains(task)) {
      int index = _tasks.indexOf(task);

      _tasks.removeAt(index);
      _tasks.insert(index, Task(name: newName));
      notifyListeners();
    }
  }
}
