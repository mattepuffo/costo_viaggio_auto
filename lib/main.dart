import 'package:costo_viaggio_auto/pagine/pedaggi_screen.dart';
import 'package:costo_viaggio_auto/pagine/viaggi_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'database/database.dart';
import 'pagine/home_screen.dart';
import 'pagine/macchine_screen.dart';
import 'widgets/tabs.dart';

final AppDatabase db = AppDatabase();

final GoRouter _router = GoRouter(
  initialLocation: '/home',
  routes: [
    ShellRoute(
      builder: (context, state, child) => MainTabScaffold(child: child),
      routes: [
        GoRoute(
          path: '/home',
          pageBuilder: (context, state) =>
              NoTransitionPage(child: HomeScreen(db: db)),
        ),
        GoRoute(
          path: '/macchine',
          pageBuilder: (context, state) =>
              NoTransitionPage(child: MacchineScreen(db: db)),
        ),
        GoRoute(
          path: '/pedaggi',
          pageBuilder: (context, state) =>
              NoTransitionPage(child: PedaggiScreen(db: db)),
        ),
        GoRoute(
          path: '/viaggi',
          pageBuilder: (context, state) =>
              NoTransitionPage(child: ViaggiScreen(db: db)),
        ),
      ],
    ),
  ],
);

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'App Consumi',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
      ),
      routerConfig: _router,
    );
  }
}