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

class $ViaggiTable extends Viaggi with TableInfo<$ViaggiTable, ViaggiData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ViaggiTable(this.attachedDatabase, [this._alias]);
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
  static const VerificationMeta _macchinaMeta = const VerificationMeta(
    'macchina',
  );
  @override
  late final GeneratedColumn<String> macchina = GeneratedColumn<String>(
    'macchina',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
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
  static const VerificationMeta _costoBenzinaMeta = const VerificationMeta(
    'costoBenzina',
  );
  @override
  late final GeneratedColumn<double> costoBenzina = GeneratedColumn<double>(
    'costo_benzina',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _costoViaggioMeta = const VerificationMeta(
    'costoViaggio',
  );
  @override
  late final GeneratedColumn<double> costoViaggio = GeneratedColumn<double>(
    'costo_viaggio',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _dataMeta = const VerificationMeta('data');
  @override
  late final GeneratedColumn<DateTime> data = GeneratedColumn<DateTime>(
    'data',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    macchina,
    tratta,
    costoBenzina,
    costoViaggio,
    data,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'viaggi';
  @override
  VerificationContext validateIntegrity(
    Insertable<ViaggiData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('macchina')) {
      context.handle(
        _macchinaMeta,
        macchina.isAcceptableOrUnknown(data['macchina']!, _macchinaMeta),
      );
    } else if (isInserting) {
      context.missing(_macchinaMeta);
    }
    if (data.containsKey('tratta')) {
      context.handle(
        _trattaMeta,
        tratta.isAcceptableOrUnknown(data['tratta']!, _trattaMeta),
      );
    } else if (isInserting) {
      context.missing(_trattaMeta);
    }
    if (data.containsKey('costo_benzina')) {
      context.handle(
        _costoBenzinaMeta,
        costoBenzina.isAcceptableOrUnknown(
          data['costo_benzina']!,
          _costoBenzinaMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_costoBenzinaMeta);
    }
    if (data.containsKey('costo_viaggio')) {
      context.handle(
        _costoViaggioMeta,
        costoViaggio.isAcceptableOrUnknown(
          data['costo_viaggio']!,
          _costoViaggioMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_costoViaggioMeta);
    }
    if (data.containsKey('data')) {
      context.handle(
        _dataMeta,
        this.data.isAcceptableOrUnknown(data['data']!, _dataMeta),
      );
    } else if (isInserting) {
      context.missing(_dataMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ViaggiData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ViaggiData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      macchina: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}macchina'],
      )!,
      tratta: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}tratta'],
      )!,
      costoBenzina: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}costo_benzina'],
      )!,
      costoViaggio: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}costo_viaggio'],
      )!,
      data: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}data'],
      )!,
    );
  }

  @override
  $ViaggiTable createAlias(String alias) {
    return $ViaggiTable(attachedDatabase, alias);
  }
}

class ViaggiData extends DataClass implements Insertable<ViaggiData> {
  final int id;
  final String macchina;
  final String tratta;
  final double costoBenzina;
  final double costoViaggio;
  final DateTime data;
  const ViaggiData({
    required this.id,
    required this.macchina,
    required this.tratta,
    required this.costoBenzina,
    required this.costoViaggio,
    required this.data,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['macchina'] = Variable<String>(macchina);
    map['tratta'] = Variable<String>(tratta);
    map['costo_benzina'] = Variable<double>(costoBenzina);
    map['costo_viaggio'] = Variable<double>(costoViaggio);
    map['data'] = Variable<DateTime>(data);
    return map;
  }

  ViaggiCompanion toCompanion(bool nullToAbsent) {
    return ViaggiCompanion(
      id: Value(id),
      macchina: Value(macchina),
      tratta: Value(tratta),
      costoBenzina: Value(costoBenzina),
      costoViaggio: Value(costoViaggio),
      data: Value(data),
    );
  }

  factory ViaggiData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ViaggiData(
      id: serializer.fromJson<int>(json['id']),
      macchina: serializer.fromJson<String>(json['macchina']),
      tratta: serializer.fromJson<String>(json['tratta']),
      costoBenzina: serializer.fromJson<double>(json['costoBenzina']),
      costoViaggio: serializer.fromJson<double>(json['costoViaggio']),
      data: serializer.fromJson<DateTime>(json['data']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'macchina': serializer.toJson<String>(macchina),
      'tratta': serializer.toJson<String>(tratta),
      'costoBenzina': serializer.toJson<double>(costoBenzina),
      'costoViaggio': serializer.toJson<double>(costoViaggio),
      'data': serializer.toJson<DateTime>(data),
    };
  }

  ViaggiData copyWith({
    int? id,
    String? macchina,
    String? tratta,
    double? costoBenzina,
    double? costoViaggio,
    DateTime? data,
  }) => ViaggiData(
    id: id ?? this.id,
    macchina: macchina ?? this.macchina,
    tratta: tratta ?? this.tratta,
    costoBenzina: costoBenzina ?? this.costoBenzina,
    costoViaggio: costoViaggio ?? this.costoViaggio,
    data: data ?? this.data,
  );
  ViaggiData copyWithCompanion(ViaggiCompanion data) {
    return ViaggiData(
      id: data.id.present ? data.id.value : this.id,
      macchina: data.macchina.present ? data.macchina.value : this.macchina,
      tratta: data.tratta.present ? data.tratta.value : this.tratta,
      costoBenzina: data.costoBenzina.present
          ? data.costoBenzina.value
          : this.costoBenzina,
      costoViaggio: data.costoViaggio.present
          ? data.costoViaggio.value
          : this.costoViaggio,
      data: data.data.present ? data.data.value : this.data,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ViaggiData(')
          ..write('id: $id, ')
          ..write('macchina: $macchina, ')
          ..write('tratta: $tratta, ')
          ..write('costoBenzina: $costoBenzina, ')
          ..write('costoViaggio: $costoViaggio, ')
          ..write('data: $data')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, macchina, tratta, costoBenzina, costoViaggio, data);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ViaggiData &&
          other.id == this.id &&
          other.macchina == this.macchina &&
          other.tratta == this.tratta &&
          other.costoBenzina == this.costoBenzina &&
          other.costoViaggio == this.costoViaggio &&
          other.data == this.data);
}

class ViaggiCompanion extends UpdateCompanion<ViaggiData> {
  final Value<int> id;
  final Value<String> macchina;
  final Value<String> tratta;
  final Value<double> costoBenzina;
  final Value<double> costoViaggio;
  final Value<DateTime> data;
  const ViaggiCompanion({
    this.id = const Value.absent(),
    this.macchina = const Value.absent(),
    this.tratta = const Value.absent(),
    this.costoBenzina = const Value.absent(),
    this.costoViaggio = const Value.absent(),
    this.data = const Value.absent(),
  });
  ViaggiCompanion.insert({
    this.id = const Value.absent(),
    required String macchina,
    required String tratta,
    required double costoBenzina,
    required double costoViaggio,
    required DateTime data,
  }) : macchina = Value(macchina),
       tratta = Value(tratta),
       costoBenzina = Value(costoBenzina),
       costoViaggio = Value(costoViaggio),
       data = Value(data);
  static Insertable<ViaggiData> custom({
    Expression<int>? id,
    Expression<String>? macchina,
    Expression<String>? tratta,
    Expression<double>? costoBenzina,
    Expression<double>? costoViaggio,
    Expression<DateTime>? data,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (macchina != null) 'macchina': macchina,
      if (tratta != null) 'tratta': tratta,
      if (costoBenzina != null) 'costo_benzina': costoBenzina,
      if (costoViaggio != null) 'costo_viaggio': costoViaggio,
      if (data != null) 'data': data,
    });
  }

  ViaggiCompanion copyWith({
    Value<int>? id,
    Value<String>? macchina,
    Value<String>? tratta,
    Value<double>? costoBenzina,
    Value<double>? costoViaggio,
    Value<DateTime>? data,
  }) {
    return ViaggiCompanion(
      id: id ?? this.id,
      macchina: macchina ?? this.macchina,
      tratta: tratta ?? this.tratta,
      costoBenzina: costoBenzina ?? this.costoBenzina,
      costoViaggio: costoViaggio ?? this.costoViaggio,
      data: data ?? this.data,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (macchina.present) {
      map['macchina'] = Variable<String>(macchina.value);
    }
    if (tratta.present) {
      map['tratta'] = Variable<String>(tratta.value);
    }
    if (costoBenzina.present) {
      map['costo_benzina'] = Variable<double>(costoBenzina.value);
    }
    if (costoViaggio.present) {
      map['costo_viaggio'] = Variable<double>(costoViaggio.value);
    }
    if (data.present) {
      map['data'] = Variable<DateTime>(data.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ViaggiCompanion(')
          ..write('id: $id, ')
          ..write('macchina: $macchina, ')
          ..write('tratta: $tratta, ')
          ..write('costoBenzina: $costoBenzina, ')
          ..write('costoViaggio: $costoViaggio, ')
          ..write('data: $data')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $MacchineTable macchine = $MacchineTable(this);
  late final $PedaggiTable pedaggi = $PedaggiTable(this);
  late final $ViaggiTable viaggi = $ViaggiTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    macchine,
    pedaggi,
    viaggi,
  ];
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
typedef $$ViaggiTableCreateCompanionBuilder =
    ViaggiCompanion Function({
      Value<int> id,
      required String macchina,
      required String tratta,
      required double costoBenzina,
      required double costoViaggio,
      required DateTime data,
    });
typedef $$ViaggiTableUpdateCompanionBuilder =
    ViaggiCompanion Function({
      Value<int> id,
      Value<String> macchina,
      Value<String> tratta,
      Value<double> costoBenzina,
      Value<double> costoViaggio,
      Value<DateTime> data,
    });

class $$ViaggiTableFilterComposer
    extends Composer<_$AppDatabase, $ViaggiTable> {
  $$ViaggiTableFilterComposer({
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

  ColumnFilters<String> get macchina => $composableBuilder(
    column: $table.macchina,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get tratta => $composableBuilder(
    column: $table.tratta,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get costoBenzina => $composableBuilder(
    column: $table.costoBenzina,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get costoViaggio => $composableBuilder(
    column: $table.costoViaggio,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get data => $composableBuilder(
    column: $table.data,
    builder: (column) => ColumnFilters(column),
  );
}

class $$ViaggiTableOrderingComposer
    extends Composer<_$AppDatabase, $ViaggiTable> {
  $$ViaggiTableOrderingComposer({
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

  ColumnOrderings<String> get macchina => $composableBuilder(
    column: $table.macchina,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get tratta => $composableBuilder(
    column: $table.tratta,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get costoBenzina => $composableBuilder(
    column: $table.costoBenzina,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get costoViaggio => $composableBuilder(
    column: $table.costoViaggio,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get data => $composableBuilder(
    column: $table.data,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$ViaggiTableAnnotationComposer
    extends Composer<_$AppDatabase, $ViaggiTable> {
  $$ViaggiTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get macchina =>
      $composableBuilder(column: $table.macchina, builder: (column) => column);

  GeneratedColumn<String> get tratta =>
      $composableBuilder(column: $table.tratta, builder: (column) => column);

  GeneratedColumn<double> get costoBenzina => $composableBuilder(
    column: $table.costoBenzina,
    builder: (column) => column,
  );

  GeneratedColumn<double> get costoViaggio => $composableBuilder(
    column: $table.costoViaggio,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get data =>
      $composableBuilder(column: $table.data, builder: (column) => column);
}

class $$ViaggiTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ViaggiTable,
          ViaggiData,
          $$ViaggiTableFilterComposer,
          $$ViaggiTableOrderingComposer,
          $$ViaggiTableAnnotationComposer,
          $$ViaggiTableCreateCompanionBuilder,
          $$ViaggiTableUpdateCompanionBuilder,
          (ViaggiData, BaseReferences<_$AppDatabase, $ViaggiTable, ViaggiData>),
          ViaggiData,
          PrefetchHooks Function()
        > {
  $$ViaggiTableTableManager(_$AppDatabase db, $ViaggiTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ViaggiTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ViaggiTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ViaggiTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> macchina = const Value.absent(),
                Value<String> tratta = const Value.absent(),
                Value<double> costoBenzina = const Value.absent(),
                Value<double> costoViaggio = const Value.absent(),
                Value<DateTime> data = const Value.absent(),
              }) => ViaggiCompanion(
                id: id,
                macchina: macchina,
                tratta: tratta,
                costoBenzina: costoBenzina,
                costoViaggio: costoViaggio,
                data: data,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String macchina,
                required String tratta,
                required double costoBenzina,
                required double costoViaggio,
                required DateTime data,
              }) => ViaggiCompanion.insert(
                id: id,
                macchina: macchina,
                tratta: tratta,
                costoBenzina: costoBenzina,
                costoViaggio: costoViaggio,
                data: data,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$ViaggiTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ViaggiTable,
      ViaggiData,
      $$ViaggiTableFilterComposer,
      $$ViaggiTableOrderingComposer,
      $$ViaggiTableAnnotationComposer,
      $$ViaggiTableCreateCompanionBuilder,
      $$ViaggiTableUpdateCompanionBuilder,
      (ViaggiData, BaseReferences<_$AppDatabase, $ViaggiTable, ViaggiData>),
      ViaggiData,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$MacchineTableTableManager get macchine =>
      $$MacchineTableTableManager(_db, _db.macchine);
  $$PedaggiTableTableManager get pedaggi =>
      $$PedaggiTableTableManager(_db, _db.pedaggi);
  $$ViaggiTableTableManager get viaggi =>
      $$ViaggiTableTableManager(_db, _db.viaggi);
}
