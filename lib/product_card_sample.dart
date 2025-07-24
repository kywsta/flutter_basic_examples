import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: ProductListPage());
  }
}

class ProductListPage extends StatefulWidget {
  const ProductListPage({super.key});

  @override
  State<ProductListPage> createState() => _ProductListPageState();
}

class _ProductListPageState extends State<ProductListPage> {
  final List<Product> products = [
    Product(
      title: 'Product 1',
      description: 'This is a product description',
      price: 100.0,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    print("Building ProductListPage");
    return Scaffold(
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          print("Building list item: ${product.title}");
          return Dismissible(
            key: ValueKey(product.title),
            onDismissed: (direction) {
              _removeProduct(index);
            },
            child: ProductCard(
              title: product.title,
              description: product.description,
              price: product.price,
              onTap: () => _updateProduct(index),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addProduct,
        child: const Icon(Icons.add),
      ),
    );
  }

  void _addProduct() {
    print("Adding product");
    final newProduct = Product(
      title: 'Product ${products.length + 1}',
      description: 'This is a product description',
      price: 100.0,
    );

    setState(() {
      products.add(newProduct);
    });
  }

  void _removeProduct(int index) {
    print("Removing product at index $index");
    setState(() {
      products.removeAt(index);
    });
  }

  void _updateProduct(int index) {
    print("Updating product at index $index");
    setState(() {
      products[index].price += 100;
    });
  }
}

class Product {
  final String title;
  final String description;
  double price;

  Product({
    required this.title,
    required this.description,
    required this.price,
  });
}

class ProductCard extends StatelessWidget {
  final String title;
  final String description;
  final double price;
  final VoidCallback onTap;

  const ProductCard({
    super.key,
    required this.title,
    required this.description,
    required this.price,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    print("Building ProductCard: $title");
    final theme = Theme.of(context);

    return Card(
      clipBehavior: Clip.hardEdge,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Text(title, style: theme.textTheme.bodyLarge),
                const SizedBox(height: 8),
                Text(description),
                const SizedBox(height: 8),
                Text(
                  '\$${price.toStringAsFixed(2)}',
                  style: theme.textTheme.bodyMedium!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
