import 'package:example_answer/stateful/answers/ans_1.dart';
import 'package:example_answer/stateful/answers/ans_2.dart';
import 'package:flutter/material.dart';

class StatefulExercices extends StatelessWidget {
  const StatefulExercices({super.key});

  static route(BuildContext context) => MaterialPageRoute(builder: (context) => const StatefulExercices());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            onTap: () => Navigator.of(context).push(
              Ans1.route(context),
            ),
            title: const Text("Exercise 1"),
            trailing: const Icon(Icons.chevron_right),
          ),
          ListTile(
            onTap: () => Navigator.of(context).push(
              Ans2.route(context),
            ),
            title: const Text("Exercise 2"),
            trailing: const Icon(Icons.chevron_right),
          ),
        ],
      ),
    );
  }
}
