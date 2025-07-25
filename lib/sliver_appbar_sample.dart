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
            expandedHeight: 200,
            floating: false,
            pinned: false,
            snap: false,
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
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.white,
                        child: Icon(Icons.person),
                      ),
                      title: Text('Flexible Space'),
                      subtitle: Text('Subtitle for Flexible Space'),
                    ),
                  ),
                ),
              ),
            ),
          ),
          SliverGrid(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              mainAxisSpacing: 10.0,
              crossAxisSpacing: 10.0,
              childAspectRatio: 4 / 3,
            ),
            delegate: SliverChildBuilderDelegate((context, index) {
              debugPrint('Building grid item $index');
              return Container(
                alignment: Alignment.center,
                color: Colors.teal[100 * (index % 9)],
                child: Text('grid item $index'),
              );
            }, childCount: 15),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
              debugPrint('Building list item $index');
              return ListTile(
                title: Text('Item $index'),
                subtitle: Text('Subtitle for item $index'),
              );
            }, childCount: 50),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.navigate_next),
      ),
    );
  }
}
