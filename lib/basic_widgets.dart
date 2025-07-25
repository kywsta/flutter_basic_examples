import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [MyStatelessWidget(), MyStatefulWidget()],
          ),
        ),
      ),
    );
  }
}

class MyStatelessWidget extends StatelessWidget {
  const MyStatelessWidget({super.key});

  @override
  Widget build(BuildContext context) {
    debugPrint('Building MyStatelessWidget');
    return const Text('This widget never changes');
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({super.key});

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  String _text = 'Initial text';

  void _updateText() {
    setState(() {
      _text = 'Updated text';
    });
  }

  @override
  Widget build(BuildContext context) {
    debugPrint('Building MyStatefulWidget');
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(_text),
        ElevatedButton(onPressed: _updateText, child: const Text('Update')),
      ],
    );
  }
}
