import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:flutter_exercises_app/model/task_model.dart';
import 'package:flutter_exercises_app/screens/home_screen.dart';

void main() => runApp(const MainApp());

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TaskModel(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.cyan[400]!),
        ),
        home: const HomeScreen(),
      ),
    );
  }
}
