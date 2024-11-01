import 'package:example_answer/network/answers/controller.dart';
import 'package:example_answer/network/answers/domain/entity/character.dart';
import 'package:flutter/material.dart';

class Ans1 extends StatefulWidget {
  static route(BuildContext context) => MaterialPageRoute(
        builder: (context) => const Ans1(),
      );

  const Ans1({super.key});

  @override
  State<Ans1> createState() => _Ans1State();
}

class _Ans1State extends State<Ans1> {
  List<Character> data = [];
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      try {
        // executes after build
        data = await Ans1Controller().getAllCharacters();
      } catch (e) {
        if (!context.mounted) return;
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Error Calling Api.")));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("GoT API"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ...data.map(
              (e) => Card(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
                  child: Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(18),
                        child: Image.network(e.imageUrl),
                      ),
                      Text(
                        e.fullName,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        e.family,
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
