import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'pagine/home.dart';
import 'widgets/tabs.dart';

void main() {
  runApp(const MyApp());
}

final GoRouter _router = GoRouter(
  initialLocation: '/',
  routes: [
    ShellRoute(
      builder: (context, state, child) {
        return MainTabScaffold(child: child);
      },
      routes: [
        GoRoute(
          path: '/',
          pageBuilder: (context, state) =>
              const NoTransitionPage(child: HomePage(title: "Home")),
        ),
        // GoRoute(
        //   path: '/cars',
        //   pageBuilder: (context, state) => const NoTransitionPage(child: CarsPage()),
        // ),
        // GoRoute(
        //   path: '/settings',
        //   pageBuilder: (context, state) => const NoTransitionPage(child: SettingsPage()),
        // ),
      ],
    ),
  ],
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
      ),
      routerConfig: _router,
    );
  }
}
