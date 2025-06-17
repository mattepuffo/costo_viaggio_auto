import 'package:costo_viaggio_auto/pagine/pedaggio_form_screen.dart';
import 'package:flutter/material.dart';
import '../database/database.dart';
import '../widgets/app_drawer.dart';

class PedaggiScreen extends StatelessWidget {
  final AppDatabase db;

  const PedaggiScreen({super.key, required this.db});

  Future<void> _cancellaPedaggio(
    BuildContext context,
    PedaggiData pedaggio,
  ) async {
    final conferma = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Conferma eliminazione'),
        content: Text(
          'Vuoi davvero eliminare il pedaggio "${pedaggio.tratta}"?',
        ),
        actions: [
          TextButton(
            child: const Text('Annulla'),
            onPressed: () => Navigator.of(context).pop(false),
          ),
          TextButton(
            child: const Text('Elimina', style: TextStyle(color: Colors.red)),
            onPressed: () => Navigator.of(context).pop(true),
          ),
        ],
      ),
    );
    if (conferma == true) {
      await db.delete(db.pedaggi).delete(pedaggio);
      if (context.mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Pedaggio eliminato')));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const AppDrawer(),
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Lista pedaggi'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            tooltip: 'Aggiungi pedaggio',
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => PedaggioFormScreen(db: db)),
              );
            },
          ),
        ],
      ),
      body: StreamBuilder<List<PedaggiData>>(
        stream: db.select(db.pedaggi).watch(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          final pedaggi = snapshot.data ?? [];
          if (pedaggi.isEmpty) {
            return const Center(child: Text("Nessun pedaggio presente"));
          }

          return ListView.separated(
            itemCount: pedaggi.length,
            separatorBuilder: (context, index) => const Divider(height: 1),
            itemBuilder: (context, index) {
              final t = pedaggi[index];
              return ListTile(
                leading: const Icon(Icons.alt_route, color: Colors.teal),
                title: Text(t.tratta),
                subtitle: Text('Costo: ${t.costo.toStringAsFixed(2)} €'),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.edit, color: Colors.teal),
                      tooltip: 'Modifica',
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (_) =>
                                PedaggioFormScreen(db: db, pedaggio: t),
                          ),
                        );
                      },
                    ),
                    IconButton(
                      icon: const Icon(Icons.delete, color: Colors.red),
                      tooltip: 'Elimina',
                      onPressed: () => _cancellaPedaggio(context, t),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
