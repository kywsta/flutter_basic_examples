import 'package:flutter/material.dart';
import 'package:flutter_basic_examples/widgets/product_card.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ProductPage(
        title: 'Product 1',
        description: 'This is a product description',
        price: 100.0,
      ),
    );
  }
}

class ProductPage extends StatelessWidget {
  final String title;
  final String description;
  final double price;

  const ProductPage({
    super.key,
    required this.title,
    required this.description,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            spacing: 16,
            children: [
              ProductCard(
                title: title,
                description: description,
                price: price,
                onTap: () {},
                onAdd: () {},
                onRemove: () {},
              ),
              Divider(),
              Text(
                "This is the details of the product which is very long and it should be displayed in multiple lines",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
