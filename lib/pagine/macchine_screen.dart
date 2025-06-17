import 'package:flutter/material.dart';
import '../database/database.dart';
import '../widgets/app_drawer.dart';
import 'macchina_form_screen.dart';

class MacchineScreen extends StatelessWidget {
  final AppDatabase db;

  const MacchineScreen({super.key, required this.db});

  Future<void> _cancellaMacchina(
    BuildContext context,
    MacchineData macchina,
  ) async {
    final conferma = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Conferma eliminazione'),
        content: Text('Vuoi davvero eliminare la macchina "${macchina.nome}"?'),
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
      await db.delete(db.macchine).delete(macchina);
      if (context.mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Macchina eliminata')));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const AppDrawer(),
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Lista macchine'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            tooltip: 'Aggiungi macchina',
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => MacchinaFormScreen(db: db)),
              );
            },
          ),
        ],
      ),
      body: StreamBuilder<List<MacchineData>>(
        stream: db.select(db.macchine).watch(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          final macchine = snapshot.data ?? [];
          if (macchine.isEmpty) {
            return const Center(child: Text("Nessuna macchina presente"));
          }

          return ListView.separated(
            itemCount: macchine.length,
            separatorBuilder: (context, index) => const Divider(height: 1),
            itemBuilder: (context, index) {
              final m = macchine[index];
              return ListTile(
                leading: const Icon(Icons.directions_car, color: Colors.teal),
                title: Text(m.nome),
                subtitle: Text(
                  'Consumo: ${m.consumo.toStringAsFixed(1)} km a litro',
                ),
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
                                MacchinaFormScreen(db: db, macchina: m),
                          ),
                        );
                      },
                    ),
                    IconButton(
                      icon: const Icon(Icons.delete, color: Colors.red),
                      tooltip: 'Elimina',
                      onPressed: () => _cancellaMacchina(context, m),
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
