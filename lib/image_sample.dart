import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(MaterialApp(home: ImageExample()));
}

class ImageExample extends StatelessWidget {
  const ImageExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Image Examples')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Network Image
            const Text('Network Image:'),
            Image.network(
              'https://picsum.photos/300/200',
              height: 200,
              fit: BoxFit.cover,
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) return child;
                return const Center(child: CircularProgressIndicator());
              },
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  height: 200,
                  color: Colors.grey[300],
                  child: const Icon(Icons.error, size: 50, color: Colors.red),
                );
              },
            ),
            const SizedBox(height: 20),

            // Asset Image (add to pubspec.yaml first)
            const Text('Asset Image:'),

            // Image.asset(
            //   'assets/images/sample.png',
            //   height: 200,
            //   fit: BoxFit.contain,
            // ),

            // Cached Network Image
            const Text('Cached Network Image:'),
            // CachedNetworkImage(
            //   imageUrl: "http://via.placeholder.com/350x150",
            //   placeholder: (context, url) => CircularProgressIndicator(),
            //   errorWidget: (context, url, error) => Icon(Icons.error),
            // ),

            // Circular Image with ClipOval
            const Text('Circular Image:'),

            ClipOval(
              child: Image.network(
                'https://picsum.photos/150/150',
                width: 150,
                height: 150,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 20),

            // Rounded corners with ClipRRect
            const Text('Rounded Image:'),
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.network(
                'https://picsum.photos/300/150',
                height: 150,
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
