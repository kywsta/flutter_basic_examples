import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(MaterialApp(home: MyTextFieldExample()));
}

class MyTextFieldExample extends StatefulWidget {
  const MyTextFieldExample({super.key});

  @override
  State<MyTextFieldExample> createState() => _MyTextFieldExampleState();
}

class _MyTextFieldExampleState extends State<MyTextFieldExample> {
  late TextEditingController _nameController;
  late TextEditingController _emailController;
  String _displayText = '';

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _emailController = TextEditingController();

    // Listen to changes
    _nameController.addListener(_onTextChanged);
  }

  @override
  void dispose() {
    // Important: Dispose controllers to prevent memory leaks
    _nameController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('TextEditingController Example')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextField(
                controller: _nameController,
                decoration: const InputDecoration(
                  labelText: 'Name',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _emailController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Email is required';
                  }
                  if (!value.contains('@')) {
                    return 'Invalid email address';
                  }
                  return null;
                },
                decoration: const InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              Text(_displayText, style: const TextStyle(fontSize: 16)),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: _clearFields,
                    child: const Text('Clear'),
                  ),
                  ElevatedButton(
                    onPressed: _setInitialValues,
                    child: const Text('Set Values'),
                  ),
                  ElevatedButton(
                    onPressed: _submitForm,
                    child: const Text('Submit'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onTextChanged() {
    setState(() {
      _displayText = 'Name: ${_nameController.text}';
    });
  }

  void _clearFields() {
    _nameController.clear();
    _emailController.clear();
  }

  void _setInitialValues() {
    _nameController.text = 'John Doe';
    _emailController.text = 'john@example.com';
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Form is valid')));
    }
  }
}
