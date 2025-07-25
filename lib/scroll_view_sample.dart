import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(MaterialApp(home: MyScrollViewExample()));
}

class MyScrollViewExample extends StatelessWidget {
  const MyScrollViewExample({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(title: const Text('ScrollView Example')),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: Text(
                  'Hello, check the following items',
                  style: theme.textTheme.titleLarge,
                ),
              ),
              Divider(),
              ...List.generate(
                20,
                (index) => ListTile(
                  visualDensity: VisualDensity.compact,
                  contentPadding: EdgeInsets.zero,
                  leading: Icon(Icons.check_circle),
                  title: Text('Item $index'),
                  trailing: Icon(Icons.arrow_forward),
                ),
              ),
              Divider(),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: Text(
                  'Great, you have seen all the items',
                  style: theme.textTheme.titleLarge,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
