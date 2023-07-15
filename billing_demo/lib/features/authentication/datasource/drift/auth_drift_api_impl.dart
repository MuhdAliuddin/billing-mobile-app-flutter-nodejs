import 'dart:math';

import 'package:drift/drift.dart';

import '../../../../core/datasource/drift/app_db.dart';
import '../../../../core/datasource/drift/tables/access_token_tbl.dart';
import '../../../../core/datasource/drift/tables/inspector_tbl.dart';
import '../../../../entities/access_token.dart';
import '../../../../entities/user.dart';
import 'auth_drift_api.dart';

class AuthenticationDriftApiImpl extends AuthenticationDriftApi {
  final AppDb db;
  AuthenticationDriftApiImpl({required this.db});

  @override
  Future<AccessToken?> findOne() async {
    var accessToken = await db.select(db.accessTokenTbl).getSingleOrNull();
    return accessToken?.toAccessToken();
  }

  @override
  Future<int?> create({required AccessToken accessToken}) async {
    var entryAccesstoken = AccessTokenTblCompanion(
      id: Value(accessToken.id ?? Random().toString()),
      token: Value(accessToken.token),
      ttl: Value(accessToken.ttl),
      userId: Value(accessToken.userId),
      createdAt: Value(DateTime.now().toIso8601String()),
    );
    int? id = await db.into(db.accessTokenTbl).insert(entryAccesstoken);
    if (accessToken.user != null) {
      var entryInspector = InspectorTblCompanion(
          id: Value(accessToken.user?.id ?? accessToken.userId ?? Random().toString()),
          email: Value(accessToken.user?.email ?? '-'),
          name: Value(accessToken.user?.name ?? "-"),
          phoneNum: Value(accessToken.user?.phoneNum ?? '-'),
          staffId: Value(accessToken.user?.staffId ?? '-'),
          icNum: Value(accessToken.user?.icNum ?? '-'),
          expiredDate: Value(accessToken.user?.expiredDate ?? '-'),
          planType: Value(accessToken.user?.planType ?? '-'));
      await db.into(db.inspectorTbl).insert(entryInspector);
    }
    return id;
  }

  @override
  Future<int> destroy() async {
    await db.delete(db.inspectorTbl).go();
    return await db.delete(db.accessTokenTbl).go();
  }

  @override
  Future<User?> findInspector() async {
    var inspectorTblData = await db.select(db.inspectorTbl).getSingleOrNull();
    return inspectorTblData?.toInspector();
  }
}
