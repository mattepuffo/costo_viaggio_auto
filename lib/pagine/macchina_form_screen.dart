import 'package:flutter/material.dart';
import 'package:drift/drift.dart' show Value;
import '../database/database.dart';

class MacchinaFormScreen extends StatefulWidget {
  final AppDatabase db;
  final MacchineData? macchina;

  const MacchinaFormScreen({super.key, required this.db, this.macchina});

  @override
  State<MacchinaFormScreen> createState() => _MacchinaFormScreenState();
}

class _MacchinaFormScreenState extends State<MacchinaFormScreen> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _nomeController;
  late TextEditingController _consumoController;

  @override
  void initState() {
    super.initState();
    _nomeController = TextEditingController(text: widget.macchina?.nome ?? '');
    _consumoController = TextEditingController(
      text: widget.macchina?.consumo.toString() ?? '',
    );
  }

  @override
  void dispose() {
    _nomeController.dispose();
    _consumoController.dispose();
    super.dispose();
  }

  Future<void> _salva() async {
    if (_formKey.currentState?.validate() != true) return;

    final nome = _nomeController.text.trim();
    final consumo = double.tryParse(
      _consumoController.text.replaceAll(',', '.'),
    );

    if (consumo == null) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Consumo non valido!')));
      return;
    }

    if (widget.macchina == null) {
      await widget.db
          .into(widget.db.macchine)
          .insert(MacchineCompanion.insert(nome: nome, consumo: consumo));
    } else {
      await (widget.db.update(widget.db.macchine)
            ..where((tbl) => tbl.id.equals(widget.macchina!.id)))
          .write(MacchineCompanion(nome: Value(nome), consumo: Value(consumo)));
    }

    if (mounted) Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    final isEditing = widget.macchina != null;
    return Scaffold(
      appBar: AppBar(
        title: Text(isEditing ? 'Modifica Macchina' : 'Nuova Macchina'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _nomeController,
                decoration: const InputDecoration(labelText: 'Nome'),
                validator: (value) => (value == null || value.trim().isEmpty)
                    ? 'Inserisci il nome'
                    : null,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _consumoController,
                decoration: const InputDecoration(
                  labelText: 'Consumo (km/l)',
                  hintText: 'Es: 16',
                ),
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                validator: (value) {
                  final v = value?.replaceAll(',', '.');
                  if (v == null || v.trim().isEmpty)
                    return 'Inserisci il consumo';
                  final c = double.tryParse(v);
                  if (c == null || c <= 0) return 'Consumo non valido';
                  return null;
                },
              ),
              const SizedBox(height: 32),
              ElevatedButton.icon(
                icon: Icon(isEditing ? Icons.save : Icons.add),
                label: Text(
                  isEditing ? 'Salva modifiche' : 'Aggiungi macchina',
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
