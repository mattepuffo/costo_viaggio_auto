import 'package:drift/drift.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'dart:io';
import 'package:drift/native.dart';

part 'database.g.dart';

class Macchine extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get nome => text()();
  RealColumn get consumo => real()();
}

class Pedaggi extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get tratta => text()();
  RealColumn get costo => real()();
}

@DriftDatabase(tables: [Macchine, Pedaggi])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'app.sqlite'));
    return NativeDatabase(file);
  });
}