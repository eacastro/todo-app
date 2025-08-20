import 'package:flutter/material.dart';
import 'package:flutter_exercises_app/dto/task.dart';

class AppConstants {
  static List<Task> tasks = [
    Task(name: 'Create To-Do App README'),
    Task(name: 'Make commit with your changes'),
    Task(name: 'Call Mom'),
    Task(name: 'Tell thank god for your life'),
    Task(name: 'Study about Flutter'),
  ];
  static const String addNewTaskLabel = 'Add New Task';
  static const String addTaskLabel = 'Add Task';
  static const String editTaskLabel = 'Edit Existing Task';
  static const String editLabel = 'Edit';
  static const String taskNameLabel = 'Task Name';
  static const String requiredFieldMsg = 'This field is required';
  static const String okLabel = 'OK';
  static const String duplicatedTaskError = 'Task name already exists';

  // Paddings used in the app:
  static const dialogPadding = EdgeInsets.only(
    left: 24.0,
    top: 12.0,
    right: 24.0,
    bottom: 12.0,
  );
}
