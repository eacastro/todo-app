import 'package:flutter/material.dart';
import 'package:flutter_exercises_app/constants/app_constants.dart';
import 'package:flutter_exercises_app/dto/task.dart';
import 'package:flutter_exercises_app/model/task_model.dart';
import 'package:provider/provider.dart';

class TaskForm extends StatefulWidget {
  const TaskForm({super.key});

  @override
  State<TaskForm> createState() => _TaskFormState();
}

class _TaskFormState extends State<TaskForm> {
  final _spacer = const SizedBox(height: 12.0);
  final _controller = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final _addLabel = const Text(AppConstants.addTaskLabel);
  final _nameDecoration = const InputDecoration(
    hintText: AppConstants.taskNameLabel,
    border: OutlineInputBorder(),
  );

  late Widget _nameField;
  late Widget _form;
  late Widget _actions;
  late List<Task> _tasks;

  @override
  void initState() {
    _nameField = TextFormField(
      controller: _controller,
      validator: _validateName,
      decoration: _nameDecoration,
    );
    _actions = OverflowBar(
      alignment: MainAxisAlignment.end,
      children: [
        ElevatedButton(
          onPressed: _addTask,
          child: _addLabel,
        ),
      ],
    );
    _form = Form(
      key: _formKey,
      child: Column(
        children: [
          _nameField,
          _spacer,
          _actions,
        ],
      ),
    );
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _tasks = Provider.of<TaskModel>(context).tasks;
  }

  @override
  Widget build(BuildContext context) {
    return _form;
  }

  void _addTask() {
    if (_formKey.currentState!.validate()) {
      Navigator.pop(context);

      final taskNotExist =
          _tasks.where((task) => task.name == _controller.text).isEmpty;
      final task = Task(name: _controller.text);

      if (_tasks.isEmpty) {
        context.read<TaskModel>().add(task);
      }

      if (taskNotExist) {
        context.read<TaskModel>().add(task);
      } else {
        const snackBar =
            SnackBar(content: Text(AppConstants.duplicatedTaskError));
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }

      _controller.clear();
    }
  }

  String? _validateName(String? value) {
    if (value != null) {
      final valueExist = _tasks.where((task) => task.name == value).isNotEmpty;

      if (value.isEmpty) {
        return AppConstants.requiredFieldMsg;
      }

      if (valueExist) {
        return AppConstants.duplicatedTaskError;
      }
    }

    return null;
  }
}
