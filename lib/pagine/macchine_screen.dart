import 'package:flutter/material.dart';
import '../database/database.dart';

class MacchineScreen extends StatelessWidget {
  final AppDatabase db;

  const MacchineScreen({super.key, required this.db});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Le mie macchine'),
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
                leading: const Icon(Icons.directions_car),
                title: Text(m.nome),
                subtitle: Text(
                  'Consumo: ${m.consumo.toStringAsFixed(1)} l/km (litri a km)',
                ),
                trailing: IconButton(
                  icon: const Icon(Icons.edit),
                  tooltip: 'Modifica',
                  onPressed: () {
                    // Sostituisci questo con la tua logica per la modifica
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Modifica ${m.nome}')),
                    );
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}
