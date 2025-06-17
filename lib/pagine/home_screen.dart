import 'package:flutter/material.dart';
import '../database/database.dart';
import '../widgets/app_drawer.dart';

class HomeScreen extends StatefulWidget {
  final AppDatabase db;

  const HomeScreen({super.key, required this.db});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  MacchineData? _selectedMacchina;
  PedaggiData? _selectedPedaggio;
  final _prezzoBenzinaController = TextEditingController();
  final _kmController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  double? _costoTotale;
  bool _puoSalvare = false;
  bool _andataRitorno = false; // <-- aggiunto

  @override
  void dispose() {
    _prezzoBenzinaController.dispose();
    _kmController.dispose();
    super.dispose();
  }

  void _calcola() {
    if (!_formKey.currentState!.validate()) return;
    final macchina = _selectedMacchina!;
    final pedaggio = _selectedPedaggio!;
    final prezzoBenzina = double.parse(
      _prezzoBenzinaController.text.replaceAll(',', '.'),
    );
    final km = double.parse(_kmController.text.replaceAll(',', '.'));
    final consumo = macchina.consumo;
    double costoPedaggio = pedaggio.costo;

    if (_andataRitorno) {
      costoPedaggio *= 2;
    }

    final costo = (km / consumo) * prezzoBenzina + costoPedaggio;
    setState(() {
      _costoTotale = costo;
      _puoSalvare = true;
    });
  }

  Future<void> _salvaViaggio() async {
    if (_selectedMacchina == null ||
        _selectedPedaggio == null ||
        _costoTotale == null) {
      return;
    }

    final nomeMacchina = _selectedMacchina!.nome;
    final nomeTratta = _selectedPedaggio!.tratta;
    final costoBenzina = double.parse(
      _prezzoBenzinaController.text.replaceAll(',', '.'),
    );
    final costoViaggio = _costoTotale!;
    final dataOra = DateTime.now();

    await widget.db
        .into(widget.db.viaggi)
        .insert(
      ViaggiCompanion.insert(
        macchina: nomeMacchina,
        tratta: nomeTratta,
        costoBenzina: costoBenzina,
        costoViaggio: costoViaggio,
        data: dataOra,
      ),
    );

    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Viaggio salvato con successo!')),
      );
      setState(() {
        _selectedMacchina = null;
        _selectedPedaggio = null;
        _prezzoBenzinaController.clear();
        _kmController.clear();
        _costoTotale = null;
        _puoSalvare = false;
        _andataRitorno = false;
      });
      _formKey.currentState?.reset();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const AppDrawer(),
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Calcolo costo viaggio'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              StreamBuilder<List<MacchineData>>(
                stream: widget.db.select(widget.db.macchine).watch(),
                builder: (context, snapshot) {
                  final macchine = snapshot.data ?? [];
                  return DropdownButtonFormField<MacchineData>(
                    decoration: const InputDecoration(
                      labelText: 'Seleziona Macchina',
                    ),
                    value: _selectedMacchina,
                    items: macchine.map((m) {
                      return DropdownMenuItem(
                        value: m,
                        child: Text(
                          '${m.nome} (${m.consumo.toStringAsFixed(1)} km/l)',
                        ),
                      );
                    }).toList(),
                    onChanged: (m) => setState(() => _selectedMacchina = m),
                    validator: (v) => v == null ? 'Scegli una macchina' : null,
                  );
                },
              ),
              const SizedBox(height: 16),
              StreamBuilder<List<PedaggiData>>(
                stream: widget.db.select(widget.db.pedaggi).watch(),
                builder: (context, snapshot) {
                  final pedaggi = snapshot.data ?? [];
                  return DropdownButtonFormField<PedaggiData>(
                    decoration: const InputDecoration(
                      labelText: 'Seleziona Pedaggio',
                    ),
                    value: _selectedPedaggio,
                    items: pedaggi.map((p) {
                      return DropdownMenuItem(
                        value: p,
                        child: Text(
                          '${p.tratta} (${p.costo.toStringAsFixed(2)} €)',
                        ),
                      );
                    }).toList(),
                    onChanged: (p) => setState(() => _selectedPedaggio = p),
                    validator: (v) => v == null ? 'Scegli una tratta' : null,
                  );
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _prezzoBenzinaController,
                decoration: const InputDecoration(
                  labelText: 'Prezzo Benzina (€ / litro)',
                  hintText: 'es: 1.95',
                ),
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                validator: (value) {
                  final v = value?.replaceAll(',', '.');
                  if (v == null || v.trim().isEmpty) {
                    return 'Inserisci il prezzo';
                  }
                  final p = double.tryParse(v);
                  if (p == null || p <= 0) return 'Prezzo non valido';
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _kmController,
                decoration: const InputDecoration(
                  labelText: 'Km percorsi',
                  hintText: 'es: 120',
                ),
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                validator: (value) {
                  final v = value?.replaceAll(',', '.');
                  if (v == null || v.trim().isEmpty) {
                    return 'Inserisci i km percorsi';
                  }
                  final km = double.tryParse(v);
                  if (km == null || km <= 0) return 'Km non valido';
                  return null;
                },
              ),
              const SizedBox(height: 16),
              CheckboxListTile(
                title: const Text('Andata e ritorno?'),
                value: _andataRitorno,
                onChanged: (val) {
                  setState(() {
                    _andataRitorno = val ?? false;
                  });
                },
                controlAffinity: ListTileControlAffinity.leading,
              ),
              const SizedBox(height: 24),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton.icon(
                      icon: const Icon(Icons.calculate),
                      label: const Text('Calcola'),
                      onPressed: _calcola,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: ElevatedButton.icon(
                      icon: const Icon(Icons.save),
                      label: const Text('Salva viaggio'),
                      onPressed: _puoSalvare ? _salvaViaggio : null,
                    ),
                  ),
                ],
              ),
              if (_costoTotale != null) ...[
                const SizedBox(height: 32),
                Text(
                  'Costo viaggio: ${_costoTotale!.toStringAsFixed(2)} €',
                  style: Theme.of(
                    context,
                  ).textTheme.titleLarge?.copyWith(color: Colors.teal),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}