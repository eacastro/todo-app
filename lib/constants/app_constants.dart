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
  static const String taskNameLabel = 'Task Name';
  static const String requiredFieldMsg = 'This field is required';
  static const String okLabel = 'OK';

}
