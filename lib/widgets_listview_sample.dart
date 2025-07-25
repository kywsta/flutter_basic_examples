import 'package:flutter/material.dart';
import 'package:flutter_basic_examples/widgets/product_card.dart';

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
    debugPrint("Building ProductListPage");
    return Scaffold(
      body: SafeArea(
        child: ListView.builder(
          padding: const EdgeInsets.all(16.0),
          itemCount: products.length,
          itemBuilder: (context, index) {
            final product = products[index];
            debugPrint("Building list item: ${product.title}");
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
                onAdd: () => _increasePrice(index),
                onRemove: () => _decreasePrice(index),
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addProduct,
        child: const Icon(Icons.add),
      ),
    );
  }

  void _addProduct() {
    debugPrint("Adding product");
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
    debugPrint("Removing product at index $index");
    setState(() {
      products.removeAt(index);
    });
  }

  void _updateProduct(int index) {
    debugPrint("Product tapped at index $index");
  }

  void _increasePrice(int index) {
    debugPrint("Increasing price at index $index");
    setState(() {
      products[index].price += 100;
    });
  }

  void _decreasePrice(int index) {
    debugPrint("Decreasing price at index $index");
    setState(() {
      products[index].price -= products[index].price > 0 ? 100 : 0;
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
