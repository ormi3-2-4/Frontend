import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class IndexScreen extends StatelessWidget {
  const IndexScreen(this.shell, {super.key});

  final StatefulNavigationShell shell;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: shell,
      bottomNavigationBar: NavigationBar(
        selectedIndex: shell.currentIndex,
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home),
            label: '홈',
            selectedIcon: Icon(Icons.home),
          ),
          NavigationDestination(
            icon: Icon(Icons.history),
            label: 'Home',
            selectedIcon: Icon(Icons.history),
          ),
          NavigationDestination(
            icon: Icon(Icons.people),
            label: 'Home',
            selectedIcon: Icon(Icons.people),
          ),
          NavigationDestination(
            icon: Icon(Icons.recommend),
            label: 'Home',
            selectedIcon: Icon(Icons.recommend),
          ),
          NavigationDestination(
            icon: Icon(Icons.person),
            label: 'Home',
            selectedIcon: Icon(Icons.person),
          ),
        ],
      ),
    );
  }
}
