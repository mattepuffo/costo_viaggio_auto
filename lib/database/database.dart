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

class Viaggi extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get macchina => text()();

  TextColumn get tratta => text()();

  RealColumn get costoBenzina => real()();

  RealColumn get costoViaggio => real()();

  DateTimeColumn get data => dateTime()();
}

@DriftDatabase(tables: [Macchine, Pedaggi, Viaggi])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 2;

  @override
  MigrationStrategy get migration => MigrationStrategy(
    onUpgrade: (m, from, to) async {
      if (from == 1) {
        await m.createTable(viaggi);
      }
    },
    onCreate: (m) async {
      await m.createAll();
    },
    beforeOpen: (details) async {
      // opzionale: callback eseguita prima dell'apertura
    },
  );
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'app.sqlite'));
    return NativeDatabase(file);
  });
}
