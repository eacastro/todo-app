import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:flutter_exercises_app/widgets/task_dialog.dart';
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
        final editButton = IconButton(
          onPressed: () => _editTask(task),
          icon: const Icon(Icons.edit_outlined),
        );

        return ListTile(
          title: Text(task.name),
          trailing: editButton,
        );
      },
      separatorBuilder: (context, index) => const Divider(),
      itemCount: _tasks.length,
    );
  }

  void _editTask(Task task) {
    context.read<TaskModel>().initEdit(task);
    showDialog(
      context: context,
      builder: (context) => const TaskDialog(),
    );
  }
}
