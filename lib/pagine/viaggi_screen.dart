import 'package:drift/drift.dart' show OrderingTerm, OrderingMode;
import 'package:flutter/material.dart';
import '../database/database.dart';
import '../widgets/app_drawer.dart';

class ViaggiScreen extends StatefulWidget {
  final AppDatabase db;

  const ViaggiScreen({super.key, required this.db});

  @override
  State<ViaggiScreen> createState() => _ViaggiScreenState();
}

class _ViaggiScreenState extends State<ViaggiScreen> {
  final TextEditingController _searchController = TextEditingController();
  String _searchText = '';

  @override
  void initState() {
    super.initState();
    _searchController.addListener(() {
      setState(() {
        _searchText = _searchController.text.trim().toLowerCase();
      });
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  Stream<List<ViaggiData>> _viaggiStream() {
    final query = (widget.db.select(widget.db.viaggi)
      ..orderBy([
        (tbl) => OrderingTerm(expression: tbl.data, mode: OrderingMode.desc),
      ]));
    return query.watch();
  }

  bool _matchesSearch(ViaggiData viaggio) {
    if (_searchText.isEmpty) return true;
    return viaggio.macchina.toLowerCase().contains(_searchText) ||
        viaggio.tratta.toLowerCase().contains(_searchText) ||
        viaggio.costoBenzina.toString().contains(_searchText) ||
        viaggio.costoViaggio.toString().contains(_searchText) ||
        viaggio.data.toString().contains(_searchText);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const AppDrawer(),
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Storico viaggi'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            TextField(
              controller: _searchController,
              decoration: const InputDecoration(
                labelText: 'Cerca',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),
            Expanded(
              child: StreamBuilder<List<ViaggiData>>(
                stream: _viaggiStream(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  final viaggi = snapshot.data!.where(_matchesSearch).toList();
                  if (viaggi.isEmpty) {
                    return const Center(child: Text("Nessun viaggio trovato"));
                  }

                  return ListView.separated(
                    itemCount: viaggi.length,
                    separatorBuilder: (context, i) => const Divider(height: 1),
                    itemBuilder: (context, i) {
                      final v = viaggi[i];
                      return ListTile(
                        leading: const Icon(
                          Icons.directions_car,
                          color: Colors.teal,
                        ),
                        title: Text('${v.macchina} - ${v.tratta}'),
                        subtitle: Text(
                          'Costo viaggio: ${v.costoViaggio.toStringAsFixed(2)} €\n'
                          'Costo benzina: ${v.costoBenzina.toStringAsFixed(2)} €\n'
                          'Data: ${_formatDateTime(v.data)}',
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _formatDateTime(DateTime dt) {
    // Formattazione: gg/mm/aaaa hh:mm
    return '${_pad(dt.day)}/${_pad(dt.month)}/${dt.year} ${_pad(dt.hour)}:${_pad(dt.minute)}';
  }

  String _pad(int n) => n < 10 ? '0$n' : '$n';
}
