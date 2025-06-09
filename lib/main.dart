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
      ],
    ),
  ],
);

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await addFakeData(db);
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

// Esempio di funzione per popolare dati fake
Future<void> addFakeData(AppDatabase db) async {
  await db
      .into(db.macchine)
      .insert(MacchineCompanion.insert(nome: "Toyota Yaris", consumo: 5.2));
  await db
      .into(db.macchine)
      .insert(MacchineCompanion.insert(nome: "Fiat Panda", consumo: 6.1));
  await db
      .into(db.pedaggi)
      .insert(
        PedaggiCompanion.insert(tratta: "Roma Sud - Ferentino", costo: 4.50),
      );
  await db
      .into(db.pedaggi)
      .insert(
        PedaggiCompanion.insert(tratta: "Milano - Brescia", costo: 13.90),
      );
  await db
      .into(db.pedaggi)
      .insert(PedaggiCompanion.insert(tratta: "Napoli - Caserta", costo: 2.10));
}
