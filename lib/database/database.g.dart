// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $MacchineTable extends Macchine
    with TableInfo<$MacchineTable, MacchineData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MacchineTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _nomeMeta = const VerificationMeta('nome');
  @override
  late final GeneratedColumn<String> nome = GeneratedColumn<String>(
    'nome',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _consumoMeta = const VerificationMeta(
    'consumo',
  );
  @override
  late final GeneratedColumn<double> consumo = GeneratedColumn<double>(
    'consumo',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [id, nome, consumo];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'macchine';
  @override
  VerificationContext validateIntegrity(
    Insertable<MacchineData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('nome')) {
      context.handle(
        _nomeMeta,
        nome.isAcceptableOrUnknown(data['nome']!, _nomeMeta),
      );
    } else if (isInserting) {
      context.missing(_nomeMeta);
    }
    if (data.containsKey('consumo')) {
      context.handle(
        _consumoMeta,
        consumo.isAcceptableOrUnknown(data['consumo']!, _consumoMeta),
      );
    } else if (isInserting) {
      context.missing(_consumoMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  MacchineData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return MacchineData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      nome: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}nome'],
      )!,
      consumo: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}consumo'],
      )!,
    );
  }

  @override
  $MacchineTable createAlias(String alias) {
    return $MacchineTable(attachedDatabase, alias);
  }
}

class MacchineData extends DataClass implements Insertable<MacchineData> {
  final int id;
  final String nome;
  final double consumo;
  const MacchineData({
    required this.id,
    required this.nome,
    required this.consumo,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['nome'] = Variable<String>(nome);
    map['consumo'] = Variable<double>(consumo);
    return map;
  }

  MacchineCompanion toCompanion(bool nullToAbsent) {
    return MacchineCompanion(
      id: Value(id),
      nome: Value(nome),
      consumo: Value(consumo),
    );
  }

  factory MacchineData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return MacchineData(
      id: serializer.fromJson<int>(json['id']),
      nome: serializer.fromJson<String>(json['nome']),
      consumo: serializer.fromJson<double>(json['consumo']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'nome': serializer.toJson<String>(nome),
      'consumo': serializer.toJson<double>(consumo),
    };
  }

  MacchineData copyWith({int? id, String? nome, double? consumo}) =>
      MacchineData(
        id: id ?? this.id,
        nome: nome ?? this.nome,
        consumo: consumo ?? this.consumo,
      );
  MacchineData copyWithCompanion(MacchineCompanion data) {
    return MacchineData(
      id: data.id.present ? data.id.value : this.id,
      nome: data.nome.present ? data.nome.value : this.nome,
      consumo: data.consumo.present ? data.consumo.value : this.consumo,
    );
  }

  @override
  String toString() {
    return (StringBuffer('MacchineData(')
          ..write('id: $id, ')
          ..write('nome: $nome, ')
          ..write('consumo: $consumo')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, nome, consumo);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is MacchineData &&
          other.id == this.id &&
          other.nome == this.nome &&
          other.consumo == this.consumo);
}

class MacchineCompanion extends UpdateCompanion<MacchineData> {
  final Value<int> id;
  final Value<String> nome;
  final Value<double> consumo;
  const MacchineCompanion({
    this.id = const Value.absent(),
    this.nome = const Value.absent(),
    this.consumo = const Value.absent(),
  });
  MacchineCompanion.insert({
    this.id = const Value.absent(),
    required String nome,
    required double consumo,
  }) : nome = Value(nome),
       consumo = Value(consumo);
  static Insertable<MacchineData> custom({
    Expression<int>? id,
    Expression<String>? nome,
    Expression<double>? consumo,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (nome != null) 'nome': nome,
      if (consumo != null) 'consumo': consumo,
    });
  }

  MacchineCompanion copyWith({
    Value<int>? id,
    Value<String>? nome,
    Value<double>? consumo,
  }) {
    return MacchineCompanion(
      id: id ?? this.id,
      nome: nome ?? this.nome,
      consumo: consumo ?? this.consumo,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (nome.present) {
      map['nome'] = Variable<String>(nome.value);
    }
    if (consumo.present) {
      map['consumo'] = Variable<double>(consumo.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MacchineCompanion(')
          ..write('id: $id, ')
          ..write('nome: $nome, ')
          ..write('consumo: $consumo')
          ..write(')'))
        .toString();
  }
}

class $PedaggiTable extends Pedaggi with TableInfo<$PedaggiTable, PedaggiData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PedaggiTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _trattaMeta = const VerificationMeta('tratta');
  @override
  late final GeneratedColumn<String> tratta = GeneratedColumn<String>(
    'tratta',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _costoMeta = const VerificationMeta('costo');
  @override
  late final GeneratedColumn<double> costo = GeneratedColumn<double>(
    'costo',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [id, tratta, costo];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'pedaggi';
  @override
  VerificationContext validateIntegrity(
    Insertable<PedaggiData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('tratta')) {
      context.handle(
        _trattaMeta,
        tratta.isAcceptableOrUnknown(data['tratta']!, _trattaMeta),
      );
    } else if (isInserting) {
      context.missing(_trattaMeta);
    }
    if (data.containsKey('costo')) {
      context.handle(
        _costoMeta,
        costo.isAcceptableOrUnknown(data['costo']!, _costoMeta),
      );
    } else if (isInserting) {
      context.missing(_costoMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  PedaggiData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PedaggiData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      tratta: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}tratta'],
      )!,
      costo: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}costo'],
      )!,
    );
  }

  @override
  $PedaggiTable createAlias(String alias) {
    return $PedaggiTable(attachedDatabase, alias);
  }
}

class PedaggiData extends DataClass implements Insertable<PedaggiData> {
  final int id;
  final String tratta;
  final double costo;
  const PedaggiData({
    required this.id,
    required this.tratta,
    required this.costo,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['tratta'] = Variable<String>(tratta);
    map['costo'] = Variable<double>(costo);
    return map;
  }

  PedaggiCompanion toCompanion(bool nullToAbsent) {
    return PedaggiCompanion(
      id: Value(id),
      tratta: Value(tratta),
      costo: Value(costo),
    );
  }

  factory PedaggiData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PedaggiData(
      id: serializer.fromJson<int>(json['id']),
      tratta: serializer.fromJson<String>(json['tratta']),
      costo: serializer.fromJson<double>(json['costo']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'tratta': serializer.toJson<String>(tratta),
      'costo': serializer.toJson<double>(costo),
    };
  }

  PedaggiData copyWith({int? id, String? tratta, double? costo}) => PedaggiData(
    id: id ?? this.id,
    tratta: tratta ?? this.tratta,
    costo: costo ?? this.costo,
  );
  PedaggiData copyWithCompanion(PedaggiCompanion data) {
    return PedaggiData(
      id: data.id.present ? data.id.value : this.id,
      tratta: data.tratta.present ? data.tratta.value : this.tratta,
      costo: data.costo.present ? data.costo.value : this.costo,
    );
  }

  @override
  String toString() {
    return (StringBuffer('PedaggiData(')
          ..write('id: $id, ')
          ..write('tratta: $tratta, ')
          ..write('costo: $costo')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, tratta, costo);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PedaggiData &&
          other.id == this.id &&
          other.tratta == this.tratta &&
          other.costo == this.costo);
}

class PedaggiCompanion extends UpdateCompanion<PedaggiData> {
  final Value<int> id;
  final Value<String> tratta;
  final Value<double> costo;
  const PedaggiCompanion({
    this.id = const Value.absent(),
    this.tratta = const Value.absent(),
    this.costo = const Value.absent(),
  });
  PedaggiCompanion.insert({
    this.id = const Value.absent(),
    required String tratta,
    required double costo,
  }) : tratta = Value(tratta),
       costo = Value(costo);
  static Insertable<PedaggiData> custom({
    Expression<int>? id,
    Expression<String>? tratta,
    Expression<double>? costo,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (tratta != null) 'tratta': tratta,
      if (costo != null) 'costo': costo,
    });
  }

  PedaggiCompanion copyWith({
    Value<int>? id,
    Value<String>? tratta,
    Value<double>? costo,
  }) {
    return PedaggiCompanion(
      id: id ?? this.id,
      tratta: tratta ?? this.tratta,
      costo: costo ?? this.costo,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (tratta.present) {
      map['tratta'] = Variable<String>(tratta.value);
    }
    if (costo.present) {
      map['costo'] = Variable<double>(costo.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PedaggiCompanion(')
          ..write('id: $id, ')
          ..write('tratta: $tratta, ')
          ..write('costo: $costo')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $MacchineTable macchine = $MacchineTable(this);
  late final $PedaggiTable pedaggi = $PedaggiTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [macchine, pedaggi];
}

typedef $$MacchineTableCreateCompanionBuilder =
    MacchineCompanion Function({
      Value<int> id,
      required String nome,
      required double consumo,
    });
typedef $$MacchineTableUpdateCompanionBuilder =
    MacchineCompanion Function({
      Value<int> id,
      Value<String> nome,
      Value<double> consumo,
    });

class $$MacchineTableFilterComposer
    extends Composer<_$AppDatabase, $MacchineTable> {
  $$MacchineTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get nome => $composableBuilder(
    column: $table.nome,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get consumo => $composableBuilder(
    column: $table.consumo,
    builder: (column) => ColumnFilters(column),
  );
}

class $$MacchineTableOrderingComposer
    extends Composer<_$AppDatabase, $MacchineTable> {
  $$MacchineTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get nome => $composableBuilder(
    column: $table.nome,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get consumo => $composableBuilder(
    column: $table.consumo,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$MacchineTableAnnotationComposer
    extends Composer<_$AppDatabase, $MacchineTable> {
  $$MacchineTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get nome =>
      $composableBuilder(column: $table.nome, builder: (column) => column);

  GeneratedColumn<double> get consumo =>
      $composableBuilder(column: $table.consumo, builder: (column) => column);
}

class $$MacchineTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $MacchineTable,
          MacchineData,
          $$MacchineTableFilterComposer,
          $$MacchineTableOrderingComposer,
          $$MacchineTableAnnotationComposer,
          $$MacchineTableCreateCompanionBuilder,
          $$MacchineTableUpdateCompanionBuilder,
          (
            MacchineData,
            BaseReferences<_$AppDatabase, $MacchineTable, MacchineData>,
          ),
          MacchineData,
          PrefetchHooks Function()
        > {
  $$MacchineTableTableManager(_$AppDatabase db, $MacchineTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$MacchineTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$MacchineTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$MacchineTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> nome = const Value.absent(),
                Value<double> consumo = const Value.absent(),
              }) => MacchineCompanion(id: id, nome: nome, consumo: consumo),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String nome,
                required double consumo,
              }) => MacchineCompanion.insert(
                id: id,
                nome: nome,
                consumo: consumo,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$MacchineTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $MacchineTable,
      MacchineData,
      $$MacchineTableFilterComposer,
      $$MacchineTableOrderingComposer,
      $$MacchineTableAnnotationComposer,
      $$MacchineTableCreateCompanionBuilder,
      $$MacchineTableUpdateCompanionBuilder,
      (
        MacchineData,
        BaseReferences<_$AppDatabase, $MacchineTable, MacchineData>,
      ),
      MacchineData,
      PrefetchHooks Function()
    >;
typedef $$PedaggiTableCreateCompanionBuilder =
    PedaggiCompanion Function({
      Value<int> id,
      required String tratta,
      required double costo,
    });
typedef $$PedaggiTableUpdateCompanionBuilder =
    PedaggiCompanion Function({
      Value<int> id,
      Value<String> tratta,
      Value<double> costo,
    });

class $$PedaggiTableFilterComposer
    extends Composer<_$AppDatabase, $PedaggiTable> {
  $$PedaggiTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get tratta => $composableBuilder(
    column: $table.tratta,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get costo => $composableBuilder(
    column: $table.costo,
    builder: (column) => ColumnFilters(column),
  );
}

class $$PedaggiTableOrderingComposer
    extends Composer<_$AppDatabase, $PedaggiTable> {
  $$PedaggiTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get tratta => $composableBuilder(
    column: $table.tratta,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get costo => $composableBuilder(
    column: $table.costo,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$PedaggiTableAnnotationComposer
    extends Composer<_$AppDatabase, $PedaggiTable> {
  $$PedaggiTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get tratta =>
      $composableBuilder(column: $table.tratta, builder: (column) => column);

  GeneratedColumn<double> get costo =>
      $composableBuilder(column: $table.costo, builder: (column) => column);
}

class $$PedaggiTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $PedaggiTable,
          PedaggiData,
          $$PedaggiTableFilterComposer,
          $$PedaggiTableOrderingComposer,
          $$PedaggiTableAnnotationComposer,
          $$PedaggiTableCreateCompanionBuilder,
          $$PedaggiTableUpdateCompanionBuilder,
          (
            PedaggiData,
            BaseReferences<_$AppDatabase, $PedaggiTable, PedaggiData>,
          ),
          PedaggiData,
          PrefetchHooks Function()
        > {
  $$PedaggiTableTableManager(_$AppDatabase db, $PedaggiTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PedaggiTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$PedaggiTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$PedaggiTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> tratta = const Value.absent(),
                Value<double> costo = const Value.absent(),
              }) => PedaggiCompanion(id: id, tratta: tratta, costo: costo),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String tratta,
                required double costo,
              }) =>
                  PedaggiCompanion.insert(id: id, tratta: tratta, costo: costo),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$PedaggiTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $PedaggiTable,
      PedaggiData,
      $$PedaggiTableFilterComposer,
      $$PedaggiTableOrderingComposer,
      $$PedaggiTableAnnotationComposer,
      $$PedaggiTableCreateCompanionBuilder,
      $$PedaggiTableUpdateCompanionBuilder,
      (PedaggiData, BaseReferences<_$AppDatabase, $PedaggiTable, PedaggiData>),
      PedaggiData,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$MacchineTableTableManager get macchine =>
      $$MacchineTableTableManager(_db, _db.macchine);
  $$PedaggiTableTableManager get pedaggi =>
      $$PedaggiTableTableManager(_db, _db.pedaggi);
}
