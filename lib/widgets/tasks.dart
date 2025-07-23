import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_exercises_app/dto/task.dart';
import 'package:flutter_exercises_app/model/task_model.dart';

class Tasks extends StatefulWidget {
  const Tasks({super.key});

  @override
  State<Tasks> createState() => _TasksState();
}

class _TasksState extends State<Tasks> {
  late List<Task> _tasks;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _tasks = Provider.of<TaskModel>(context).tasks;
  }

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) {
        final task = _tasks[index];

        return ListTile(title: Text(task.name));
      },
      separatorBuilder: (context, index) => const Divider(),
      itemCount: _tasks.length,
    );
  }
}
