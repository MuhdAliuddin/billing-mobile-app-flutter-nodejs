import 'package:drift/drift.dart';

import '../../../../entities/user.dart';
import '../app_db.dart';

class InspectorTbl extends Table {
  TextColumn get id => text()();
  TextColumn get name => text().nullable()();
  TextColumn get phoneNum => text().nullable()();
  TextColumn get staffId => text().nullable()();
  TextColumn get email => text().nullable()();
  TextColumn get icNum => text().nullable()();
  TextColumn get expiredDate => text().nullable()();
  TextColumn get planType => text().nullable()();
  @override
  Set<Column> get primaryKey => {id};
}

extension InspectorTblInspector on InspectorTblData {
  User toInspector() {
    return User(
      id: id,
      name: name,
      email: email,
      phoneNum: phoneNum,
      staffId: staffId,
      icNum: icNum,
      expiredDate: expiredDate,
      planType: planType,
    );
  }
}
