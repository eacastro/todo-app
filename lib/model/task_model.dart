import 'package:flutter/material.dart';
import 'package:flutter_exercises_app/constants/app_constants.dart';
import 'package:flutter_exercises_app/dto/task.dart';

class TaskModel extends ChangeNotifier {
  TaskModel() {
    _initTasks();
  }

  final List<Task> _tasks = [];

  List<Task> get tasks => _tasks;

  void add(Task task) {
    _tasks.add(task);
    notifyListeners();
  }

  void _initTasks() {
    _tasks.addAll(AppConstants.tasks);
  }
}
