// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_db.dart';

// ignore_for_file: type=lint
class $AccessTokenTblTable extends AccessTokenTbl
    with TableInfo<$AccessTokenTblTable, AccessTokenTblData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AccessTokenTblTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _tokenMeta = const VerificationMeta('token');
  @override
  late final GeneratedColumn<String> token = GeneratedColumn<String>(
      'token', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _ttlMeta = const VerificationMeta('ttl');
  @override
  late final GeneratedColumn<int> ttl = GeneratedColumn<int>(
      'ttl', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<String> createdAt = GeneratedColumn<String>(
      'created_at', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<String> userId = GeneratedColumn<String>(
      'user_id', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [id, token, ttl, createdAt, userId];
  @override
  String get aliasedName => _alias ?? 'access_token_tbl';
  @override
  String get actualTableName => 'access_token_tbl';
  @override
  VerificationContext validateIntegrity(Insertable<AccessTokenTblData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('token')) {
      context.handle(
          _tokenMeta, token.isAcceptableOrUnknown(data['token']!, _tokenMeta));
    }
    if (data.containsKey('ttl')) {
      context.handle(
          _ttlMeta, ttl.isAcceptableOrUnknown(data['ttl']!, _ttlMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    if (data.containsKey('user_id')) {
      context.handle(_userIdMeta,
          userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  AccessTokenTblData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return AccessTokenTblData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      token: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}token']),
      ttl: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}ttl'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}created_at']),
      userId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}user_id']),
    );
  }

  @override
  $AccessTokenTblTable createAlias(String alias) {
    return $AccessTokenTblTable(attachedDatabase, alias);
  }
}

class AccessTokenTblData extends DataClass
    implements Insertable<AccessTokenTblData> {
  final String id;
  final String? token;
  final int ttl;
  final String? createdAt;
  final String? userId;
  const AccessTokenTblData(
      {required this.id,
      this.token,
      required this.ttl,
      this.createdAt,
      this.userId});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    if (!nullToAbsent || token != null) {
      map['token'] = Variable<String>(token);
    }
    map['ttl'] = Variable<int>(ttl);
    if (!nullToAbsent || createdAt != null) {
      map['created_at'] = Variable<String>(createdAt);
    }
    if (!nullToAbsent || userId != null) {
      map['user_id'] = Variable<String>(userId);
    }
    return map;
  }

  AccessTokenTblCompanion toCompanion(bool nullToAbsent) {
    return AccessTokenTblCompanion(
      id: Value(id),
      token:
          token == null && nullToAbsent ? const Value.absent() : Value(token),
      ttl: Value(ttl),
      createdAt: createdAt == null && nullToAbsent
          ? const Value.absent()
          : Value(createdAt),
      userId:
          userId == null && nullToAbsent ? const Value.absent() : Value(userId),
    );
  }

  factory AccessTokenTblData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return AccessTokenTblData(
      id: serializer.fromJson<String>(json['id']),
      token: serializer.fromJson<String?>(json['token']),
      ttl: serializer.fromJson<int>(json['ttl']),
      createdAt: serializer.fromJson<String?>(json['createdAt']),
      userId: serializer.fromJson<String?>(json['userId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'token': serializer.toJson<String?>(token),
      'ttl': serializer.toJson<int>(ttl),
      'createdAt': serializer.toJson<String?>(createdAt),
      'userId': serializer.toJson<String?>(userId),
    };
  }

  AccessTokenTblData copyWith(
          {String? id,
          Value<String?> token = const Value.absent(),
          int? ttl,
          Value<String?> createdAt = const Value.absent(),
          Value<String?> userId = const Value.absent()}) =>
      AccessTokenTblData(
        id: id ?? this.id,
        token: token.present ? token.value : this.token,
        ttl: ttl ?? this.ttl,
        createdAt: createdAt.present ? createdAt.value : this.createdAt,
        userId: userId.present ? userId.value : this.userId,
      );
  @override
  String toString() {
    return (StringBuffer('AccessTokenTblData(')
          ..write('id: $id, ')
          ..write('token: $token, ')
          ..write('ttl: $ttl, ')
          ..write('createdAt: $createdAt, ')
          ..write('userId: $userId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, token, ttl, createdAt, userId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AccessTokenTblData &&
          other.id == this.id &&
          other.token == this.token &&
          other.ttl == this.ttl &&
          other.createdAt == this.createdAt &&
          other.userId == this.userId);
}

class AccessTokenTblCompanion extends UpdateCompanion<AccessTokenTblData> {
  final Value<String> id;
  final Value<String?> token;
  final Value<int> ttl;
  final Value<String?> createdAt;
  final Value<String?> userId;
  final Value<int> rowid;
  const AccessTokenTblCompanion({
    this.id = const Value.absent(),
    this.token = const Value.absent(),
    this.ttl = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.userId = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  AccessTokenTblCompanion.insert({
    required String id,
    this.token = const Value.absent(),
    this.ttl = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.userId = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id);
  static Insertable<AccessTokenTblData> custom({
    Expression<String>? id,
    Expression<String>? token,
    Expression<int>? ttl,
    Expression<String>? createdAt,
    Expression<String>? userId,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (token != null) 'token': token,
      if (ttl != null) 'ttl': ttl,
      if (createdAt != null) 'created_at': createdAt,
      if (userId != null) 'user_id': userId,
      if (rowid != null) 'rowid': rowid,
    });
  }

  AccessTokenTblCompanion copyWith(
      {Value<String>? id,
      Value<String?>? token,
      Value<int>? ttl,
      Value<String?>? createdAt,
      Value<String?>? userId,
      Value<int>? rowid}) {
    return AccessTokenTblCompanion(
      id: id ?? this.id,
      token: token ?? this.token,
      ttl: ttl ?? this.ttl,
      createdAt: createdAt ?? this.createdAt,
      userId: userId ?? this.userId,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (token.present) {
      map['token'] = Variable<String>(token.value);
    }
    if (ttl.present) {
      map['ttl'] = Variable<int>(ttl.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<String>(createdAt.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<String>(userId.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AccessTokenTblCompanion(')
          ..write('id: $id, ')
          ..write('token: $token, ')
          ..write('ttl: $ttl, ')
          ..write('createdAt: $createdAt, ')
          ..write('userId: $userId, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $InspectorTblTable extends InspectorTbl
    with TableInfo<$InspectorTblTable, InspectorTblData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $InspectorTblTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _phoneNumMeta =
      const VerificationMeta('phoneNum');
  @override
  late final GeneratedColumn<String> phoneNum = GeneratedColumn<String>(
      'phone_num', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _staffIdMeta =
      const VerificationMeta('staffId');
  @override
  late final GeneratedColumn<String> staffId = GeneratedColumn<String>(
      'staff_id', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _emailMeta = const VerificationMeta('email');
  @override
  late final GeneratedColumn<String> email = GeneratedColumn<String>(
      'email', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _icNumMeta = const VerificationMeta('icNum');
  @override
  late final GeneratedColumn<String> icNum = GeneratedColumn<String>(
      'ic_num', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _expiredDateMeta =
      const VerificationMeta('expiredDate');
  @override
  late final GeneratedColumn<String> expiredDate = GeneratedColumn<String>(
      'expired_date', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _planTypeMeta =
      const VerificationMeta('planType');
  @override
  late final GeneratedColumn<String> planType = GeneratedColumn<String>(
      'plan_type', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns =>
      [id, name, phoneNum, staffId, email, icNum, expiredDate, planType];
  @override
  String get aliasedName => _alias ?? 'inspector_tbl';
  @override
  String get actualTableName => 'inspector_tbl';
  @override
  VerificationContext validateIntegrity(Insertable<InspectorTblData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    }
    if (data.containsKey('phone_num')) {
      context.handle(_phoneNumMeta,
          phoneNum.isAcceptableOrUnknown(data['phone_num']!, _phoneNumMeta));
    }
    if (data.containsKey('staff_id')) {
      context.handle(_staffIdMeta,
          staffId.isAcceptableOrUnknown(data['staff_id']!, _staffIdMeta));
    }
    if (data.containsKey('email')) {
      context.handle(
          _emailMeta, email.isAcceptableOrUnknown(data['email']!, _emailMeta));
    }
    if (data.containsKey('ic_num')) {
      context.handle(
          _icNumMeta, icNum.isAcceptableOrUnknown(data['ic_num']!, _icNumMeta));
    }
    if (data.containsKey('expired_date')) {
      context.handle(
          _expiredDateMeta,
          expiredDate.isAcceptableOrUnknown(
              data['expired_date']!, _expiredDateMeta));
    }
    if (data.containsKey('plan_type')) {
      context.handle(_planTypeMeta,
          planType.isAcceptableOrUnknown(data['plan_type']!, _planTypeMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  InspectorTblData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return InspectorTblData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name']),
      phoneNum: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}phone_num']),
      staffId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}staff_id']),
      email: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}email']),
      icNum: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}ic_num']),
      expiredDate: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}expired_date']),
      planType: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}plan_type']),
    );
  }

  @override
  $InspectorTblTable createAlias(String alias) {
    return $InspectorTblTable(attachedDatabase, alias);
  }
}

class InspectorTblData extends DataClass
    implements Insertable<InspectorTblData> {
  final String id;
  final String? name;
  final String? phoneNum;
  final String? staffId;
  final String? email;
  final String? icNum;
  final String? expiredDate;
  final String? planType;
  const InspectorTblData(
      {required this.id,
      this.name,
      this.phoneNum,
      this.staffId,
      this.email,
      this.icNum,
      this.expiredDate,
      this.planType});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    if (!nullToAbsent || name != null) {
      map['name'] = Variable<String>(name);
    }
    if (!nullToAbsent || phoneNum != null) {
      map['phone_num'] = Variable<String>(phoneNum);
    }
    if (!nullToAbsent || staffId != null) {
      map['staff_id'] = Variable<String>(staffId);
    }
    if (!nullToAbsent || email != null) {
      map['email'] = Variable<String>(email);
    }
    if (!nullToAbsent || icNum != null) {
      map['ic_num'] = Variable<String>(icNum);
    }
    if (!nullToAbsent || expiredDate != null) {
      map['expired_date'] = Variable<String>(expiredDate);
    }
    if (!nullToAbsent || planType != null) {
      map['plan_type'] = Variable<String>(planType);
    }
    return map;
  }

  InspectorTblCompanion toCompanion(bool nullToAbsent) {
    return InspectorTblCompanion(
      id: Value(id),
      name: name == null && nullToAbsent ? const Value.absent() : Value(name),
      phoneNum: phoneNum == null && nullToAbsent
          ? const Value.absent()
          : Value(phoneNum),
      staffId: staffId == null && nullToAbsent
          ? const Value.absent()
          : Value(staffId),
      email:
          email == null && nullToAbsent ? const Value.absent() : Value(email),
      icNum:
          icNum == null && nullToAbsent ? const Value.absent() : Value(icNum),
      expiredDate: expiredDate == null && nullToAbsent
          ? const Value.absent()
          : Value(expiredDate),
      planType: planType == null && nullToAbsent
          ? const Value.absent()
          : Value(planType),
    );
  }

  factory InspectorTblData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return InspectorTblData(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String?>(json['name']),
      phoneNum: serializer.fromJson<String?>(json['phoneNum']),
      staffId: serializer.fromJson<String?>(json['staffId']),
      email: serializer.fromJson<String?>(json['email']),
      icNum: serializer.fromJson<String?>(json['icNum']),
      expiredDate: serializer.fromJson<String?>(json['expiredDate']),
      planType: serializer.fromJson<String?>(json['planType']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String?>(name),
      'phoneNum': serializer.toJson<String?>(phoneNum),
      'staffId': serializer.toJson<String?>(staffId),
      'email': serializer.toJson<String?>(email),
      'icNum': serializer.toJson<String?>(icNum),
      'expiredDate': serializer.toJson<String?>(expiredDate),
      'planType': serializer.toJson<String?>(planType),
    };
  }

  InspectorTblData copyWith(
          {String? id,
          Value<String?> name = const Value.absent(),
          Value<String?> phoneNum = const Value.absent(),
          Value<String?> staffId = const Value.absent(),
          Value<String?> email = const Value.absent(),
          Value<String?> icNum = const Value.absent(),
          Value<String?> expiredDate = const Value.absent(),
          Value<String?> planType = const Value.absent()}) =>
      InspectorTblData(
        id: id ?? this.id,
        name: name.present ? name.value : this.name,
        phoneNum: phoneNum.present ? phoneNum.value : this.phoneNum,
        staffId: staffId.present ? staffId.value : this.staffId,
        email: email.present ? email.value : this.email,
        icNum: icNum.present ? icNum.value : this.icNum,
        expiredDate: expiredDate.present ? expiredDate.value : this.expiredDate,
        planType: planType.present ? planType.value : this.planType,
      );
  @override
  String toString() {
    return (StringBuffer('InspectorTblData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('phoneNum: $phoneNum, ')
          ..write('staffId: $staffId, ')
          ..write('email: $email, ')
          ..write('icNum: $icNum, ')
          ..write('expiredDate: $expiredDate, ')
          ..write('planType: $planType')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id, name, phoneNum, staffId, email, icNum, expiredDate, planType);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is InspectorTblData &&
          other.id == this.id &&
          other.name == this.name &&
          other.phoneNum == this.phoneNum &&
          other.staffId == this.staffId &&
          other.email == this.email &&
          other.icNum == this.icNum &&
          other.expiredDate == this.expiredDate &&
          other.planType == this.planType);
}

class InspectorTblCompanion extends UpdateCompanion<InspectorTblData> {
  final Value<String> id;
  final Value<String?> name;
  final Value<String?> phoneNum;
  final Value<String?> staffId;
  final Value<String?> email;
  final Value<String?> icNum;
  final Value<String?> expiredDate;
  final Value<String?> planType;
  final Value<int> rowid;
  const InspectorTblCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.phoneNum = const Value.absent(),
    this.staffId = const Value.absent(),
    this.email = const Value.absent(),
    this.icNum = const Value.absent(),
    this.expiredDate = const Value.absent(),
    this.planType = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  InspectorTblCompanion.insert({
    required String id,
    this.name = const Value.absent(),
    this.phoneNum = const Value.absent(),
    this.staffId = const Value.absent(),
    this.email = const Value.absent(),
    this.icNum = const Value.absent(),
    this.expiredDate = const Value.absent(),
    this.planType = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id);
  static Insertable<InspectorTblData> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<String>? phoneNum,
    Expression<String>? staffId,
    Expression<String>? email,
    Expression<String>? icNum,
    Expression<String>? expiredDate,
    Expression<String>? planType,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (phoneNum != null) 'phone_num': phoneNum,
      if (staffId != null) 'staff_id': staffId,
      if (email != null) 'email': email,
      if (icNum != null) 'ic_num': icNum,
      if (expiredDate != null) 'expired_date': expiredDate,
      if (planType != null) 'plan_type': planType,
      if (rowid != null) 'rowid': rowid,
    });
  }

  InspectorTblCompanion copyWith(
      {Value<String>? id,
      Value<String?>? name,
      Value<String?>? phoneNum,
      Value<String?>? staffId,
      Value<String?>? email,
      Value<String?>? icNum,
      Value<String?>? expiredDate,
      Value<String?>? planType,
      Value<int>? rowid}) {
    return InspectorTblCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      phoneNum: phoneNum ?? this.phoneNum,
      staffId: staffId ?? this.staffId,
      email: email ?? this.email,
      icNum: icNum ?? this.icNum,
      expiredDate: expiredDate ?? this.expiredDate,
      planType: planType ?? this.planType,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (phoneNum.present) {
      map['phone_num'] = Variable<String>(phoneNum.value);
    }
    if (staffId.present) {
      map['staff_id'] = Variable<String>(staffId.value);
    }
    if (email.present) {
      map['email'] = Variable<String>(email.value);
    }
    if (icNum.present) {
      map['ic_num'] = Variable<String>(icNum.value);
    }
    if (expiredDate.present) {
      map['expired_date'] = Variable<String>(expiredDate.value);
    }
    if (planType.present) {
      map['plan_type'] = Variable<String>(planType.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('InspectorTblCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('phoneNum: $phoneNum, ')
          ..write('staffId: $staffId, ')
          ..write('email: $email, ')
          ..write('icNum: $icNum, ')
          ..write('expiredDate: $expiredDate, ')
          ..write('planType: $planType, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDb extends GeneratedDatabase {
  _$AppDb(QueryExecutor e) : super(e);
  late final $AccessTokenTblTable accessTokenTbl = $AccessTokenTblTable(this);
  late final $InspectorTblTable inspectorTbl = $InspectorTblTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [accessTokenTbl, inspectorTbl];
}
