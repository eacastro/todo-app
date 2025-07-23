import 'package:flutter/material.dart';
import 'package:flutter_exercises_app/constants/app_constants.dart';
import 'package:flutter_exercises_app/dto/task.dart';
import 'package:flutter_exercises_app/model/task_model.dart';
import 'package:flutter_exercises_app/widgets/task_form.dart';
import 'package:provider/provider.dart';

class AddDialog extends StatefulWidget {
  const AddDialog({super.key});

  @override
  State<AddDialog> createState() => _AddDialogState();
}

class _AddDialogState extends State<AddDialog> {
  final _title = const Text(AppConstants.addTaskLabel);
  final _btnContent = const Text(AppConstants.okLabel);
  final _padding = const EdgeInsets.only(
    left: 24.0,
    top: 12.0,
    right: 24.0,
    bottom: 12.0,
  );

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      title: _title,
      contentPadding: _padding,
      children: const [TaskForm()],
    );
  }
}
