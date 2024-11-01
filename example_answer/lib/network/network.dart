import 'package:example_answer/network/answers/ans1.dart';
import 'package:flutter/material.dart';

class NetworkExercises extends StatelessWidget {
  const NetworkExercises({super.key});

  static route(BuildContext context) => MaterialPageRoute(builder: (context) => const NetworkExercises());

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
        ],
      ),
    );
  }
}