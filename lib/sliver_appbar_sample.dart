import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(const MaterialApp(home: BasicSliverAppBarExample()));
}

class BasicSliverAppBarExample extends StatelessWidget {
  const BasicSliverAppBarExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: const Text('Basic SliverAppBar'),
            // Height when expanded
            expandedHeight: 200,

            // Floating: AppBar appears as soon as you scroll up
            floating: true,

            // Pinned: AppBar remains visible when collapsed
            pinned: true,

            // Snap: AppBar snaps open/closed when floating
            snap: true,

            // Stretch: Allows over-scroll stretching
            stretch: false,

            // Flexible space bar for expanded content
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [Colors.blue, Colors.purple],
                  ),
                ),
                child: const SafeArea(
                  child: Center(
                    child: Text(
                      'Flexible Space',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
              ),
            ),

            // Bottom widget (like TabBar)
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(48),
              child: Container(
                height: 48,
                alignment: Alignment.center,
                child: const Text(
                  'Bottom Widget',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
          SliverSafeArea(
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate((context, index) {
                debugPrint('Building list item $index');
                return ListTile(
                  title: Text('Item $index'),
                  subtitle: Text('Subtitle for item $index'),
                );
              }, childCount: 50),
            ),
          ),
        ],
      ),
    );
  }
}
