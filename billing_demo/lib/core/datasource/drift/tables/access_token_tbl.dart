import 'package:drift/drift.dart';

import '../../../../entities/access_token.dart';
import '../app_db.dart';

class AccessTokenTbl extends Table {
  TextColumn get id => text()();
  TextColumn get token => text().nullable()();
  IntColumn get ttl => integer().withDefault(const Constant(0))();
  TextColumn get createdAt => text().nullable()();
  TextColumn get userId => text().nullable()();
  @override
  Set<Column> get primaryKey => {id};
}

extension AccessTokenTblDataAccessToken on AccessTokenTblData {
  AccessToken toAccessToken() {
    return AccessToken(
      id: id,
      token: token,
      ttl: ttl,
      createdAt: createdAt,
      userId: userId,
    );
  }
}
