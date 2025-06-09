import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MainTabScaffold extends StatelessWidget {
  final Widget child;

  const MainTabScaffold({required this.child, super.key});

  static final tabs = ['/', '/macchine', '/tratte'];

  int _locationToTabIndex(BuildContext context) {
    final location = GoRouterState.of(context).uri.toString();
    return tabs.indexWhere((element) => location.startsWith(element));
  }

  @override
  Widget build(BuildContext context) {
    final currentIndex = _locationToTabIndex(context);

    return Scaffold(
      body: child,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex < 0 ? 0 : currentIndex,
        onTap: (index) {
          if (index != currentIndex) {
            context.go(tabs[index]);
          }
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.directions_car),
            label: 'Auto',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_road),
            label: 'Tratte',
          ),
        ],
      ),
    );
  }
}
