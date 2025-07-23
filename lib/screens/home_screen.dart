import 'package:flutter/material.dart';
import 'package:flutter_exercises_app/constants/app_constants.dart';
import 'package:flutter_exercises_app/dto/task.dart';
import 'package:flutter_exercises_app/model/task_model.dart';
import 'package:flutter_exercises_app/widgets/add_dialog.dart';
import 'package:provider/provider.dart';
import 'package:flutter_exercises_app/widgets/tasks.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _fabIcon = const Icon(Icons.add_outlined);
  final _items = const Center(child: Tasks());

  late FloatingActionButton _fabAddTask;

  @override
  void initState() {
    _fabAddTask = FloatingActionButton(
      onPressed: _addNewTask,
      child: _fabIcon,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _items,
      floatingActionButton: _fabAddTask,
    );
  }

  void _addNewTask() {
    showDialog(
      context: context,
      builder: (context) {
        return const AddDialog();
      },
    );
  }
}
