import 'package:flutter/material.dart';
import 'package:flutter_exercises_app/constants/app_constants.dart';
import 'package:flutter_exercises_app/model/task_model.dart';
import 'package:flutter_exercises_app/widgets/task_form.dart';
import 'package:provider/provider.dart';

class TaskDialog extends StatefulWidget {
  const TaskDialog({super.key});

  @override
  State<TaskDialog> createState() => _TaskDialogState();
}

class _TaskDialogState extends State<TaskDialog> {
  final _padding = AppConstants.dialogPadding;
  final _dialogChildren = const <Widget>[TaskForm()];

  late Widget _title;
  late bool _showEditModal;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _showEditModal = Provider.of<TaskModel>(context).showEditModal;
    _title = (_showEditModal)
        ? const Text(AppConstants.editTaskLabel)
        : const Text(AppConstants.addTaskLabel);
  }

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      title: _title,
      contentPadding: _padding,
      children: _dialogChildren,
    );
  }
}
