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
  Widget build(BuildContext context) {
    return _form;
  }

  void _addTask() {
    if (_formKey.currentState!.validate()) {
      Navigator.pop(context);
      context.read<TaskModel>().add(
            Task(name: _controller.text),
          );
      _controller.clear();
    }
  }

  String? _validateName(String? value) {
    return (value != null && value.isNotEmpty)
        ? null
        : AppConstants.requiredFieldMsg;
  }
}
