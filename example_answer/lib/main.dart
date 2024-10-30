import 'package:example_answer/network/network.dart';
import 'package:example_answer/preference_service.dart';
import 'package:example_answer/state_management/providers/cart.dart';
import 'package:example_answer/state_management/state_management.dart';
import 'package:example_answer/stateful/stateful_exercices.dart';
import 'package:example_answer/stateless/stateless_exercices.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Ensure Flutter is initialized
  await PreferencesService.initialize();
  runApp(
    ChangeNotifierProvider(
      create: (_) => CartProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    bool darkTheme = PreferencesService().getDarkTheme();

    return MaterialApp(
      title: 'Example Answer',
      theme: ThemeData.light(), // Light theme settings
      darkTheme: ThemeData.dark(), // Dark theme settings
      themeMode: darkTheme ? ThemeMode.dark : ThemeMode.light,
      home: MyHomePage(
        onPressed: (isDarkTheme) => setState(() {
          PreferencesService().setDarkTheme(isDarkTheme);
        }),
        isDarkTheme: darkTheme,
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final Function(bool isDarkTheme) onPressed;
  final bool isDarkTheme;
  const MyHomePage({required this.onPressed, required this.isDarkTheme, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Example Answer",
        ),
        actions: [
          isDarkTheme
              ? IconButton(
                  onPressed: () => onPressed(false),
                  icon: const Icon(Icons.light_mode),
                )
              : IconButton(
                  onPressed: () => onPressed(true),
                  icon: const Icon(Icons.dark_mode),
                ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            GestureDetector(
              onTap: () => Navigator.of(context).push(
                StatelessExercices.route(context),
              ),
              child: const Card(
                  child: Padding(
                padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                child: Text(
                  "Stateless",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              )),
            ),
            GestureDetector(
              onTap: () => Navigator.of(context).push(
                StatefulExercices.route(context),
              ),
              child: const Card(
                  child: Padding(
                padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                child: Text(
                  "Stateful",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              )),
            ),
            GestureDetector(
              onTap: () => Navigator.of(context).push(
                StateManagementExercises.route(context),
              ),
              child: const Card(
                  child: Padding(
                padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                child: Text(
                  "State Management",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              )),
            ),
            GestureDetector(
              onTap: () => Navigator.of(context).push(
                NetworkExercises.route(context),
              ),
              child: const Card(
                  child: Padding(
                padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                child: Text(
                  "Network",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              )),
            ),
          ],
        ),
      ),
    );
  }
}
