import 'package:flutter/material.dart';
import 'package:drift/drift.dart' show Value;
import '../database/database.dart';

class PedaggioFormScreen extends StatefulWidget {
  final AppDatabase db;
  final PedaggiData? pedaggio;

  const PedaggioFormScreen({super.key, required this.db, this.pedaggio});

  @override
  State<PedaggioFormScreen> createState() => _PedaggioFormScreenState();
}

class _PedaggioFormScreenState extends State<PedaggioFormScreen> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _trattaController;
  late TextEditingController _costoController;

  @override
  void initState() {
    super.initState();
    _trattaController = TextEditingController(
      text: widget.pedaggio?.tratta ?? '',
    );
    _costoController = TextEditingController(
      text: widget.pedaggio?.costo.toString() ?? '',
    );
  }

  @override
  void dispose() {
    _trattaController.dispose();
    _costoController.dispose();
    super.dispose();
  }

  Future<void> _salva() async {
    if (_formKey.currentState?.validate() != true) return;

    final tratta = _trattaController.text.trim();
    final costo = double.tryParse(_costoController.text.replaceAll(',', '.'));

    if (costo == null) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Costo non valido!')));
      return;
    }

    if (widget.pedaggio == null) {
      await widget.db
          .into(widget.db.pedaggi)
          .insert(PedaggiCompanion.insert(tratta: tratta, costo: costo));
    } else {
      await (widget.db.update(widget.db.pedaggi)
            ..where((tbl) => tbl.id.equals(widget.pedaggio!.id)))
          .write(PedaggiCompanion(tratta: Value(tratta), costo: Value(costo)));
    }

    if (mounted) Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    final isEditing = widget.pedaggio != null;
    return Scaffold(
      appBar: AppBar(
        title: Text(isEditing ? 'Modifica Pedaggio' : 'Nuovo Pedaggio'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _trattaController,
                decoration: const InputDecoration(labelText: 'Nome tratta'),
                validator: (value) => (value == null || value.trim().isEmpty)
                    ? 'Inserisci il nome della tratta'
                    : null,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _costoController,
                decoration: const InputDecoration(
                  labelText: 'Costo (€)',
                  hintText: 'Es: 12.50',
                ),
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                validator: (value) {
                  final v = value?.replaceAll(',', '.');
                  if (v == null || v.trim().isEmpty) {
                    return 'Inserisci il costo';
                  }
                  final c = double.tryParse(v);
                  if (c == null || c < 0) return 'Costo non valido';
                  return null;
                },
              ),
              const SizedBox(height: 32),
              ElevatedButton.icon(
                icon: Icon(isEditing ? Icons.save : Icons.add),
                label: Text(
                  isEditing ? 'Salva modifiche' : 'Aggiungi pedaggio',
                ),
                onPressed: _salva,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
