import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late int _counter;

  @override
  void initState() {
    _counter = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('The counter is'),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ],
        ),
      ),
      floatingActionButton: OverflowBar(
        children: [
          FloatingActionButton(
            onPressed: () {
              setState(
                () => _counter++,
              );
            },
            child: const Icon(Icons.add),
          ),
          const SizedBox(
            width: 16.0,
          ),
          FloatingActionButton(
            onPressed: () {
              setState(
                () => _counter--,
              );
            },
            child: const Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}
