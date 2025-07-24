import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: Scaffold(body: MyContainer()));
  }
}

class MyContainer extends StatelessWidget {
  const MyContainer({super.key});

  @override
  Widget build(BuildContext context) {
    // Accessing theme data
    final theme = Theme.of(context);

    // Accessing media query data
    final screenSize = MediaQuery.of(context).size;

    return Container(
      color: theme.colorScheme.primary,
      width: screenSize.width * 0.5,
      height: screenSize.height * 0.5,
      child: Center(
        child: Text('Hello World!'),
      ),
    );
  }
}
