import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

import 'tables/access_token_tbl.dart';
import 'tables/inspector_tbl.dart';

part 'app_db.g.dart';

// *************************************************************************************************
//                                         IMPORTANT !!!
// *************************************************************************************************
// Each time you modified this files:
// 1. Stop the app
// 2. Clear the app data in the Android app settings
// 3. Run : flutter pub run build_runner build --delete-conflicting-outputs

@DriftDatabase(tables: [
  AccessTokenTbl,
  InspectorTbl,
])
class AppDb extends _$AppDb {
  AppDb() : super(_openConnection());
  @override
  int get schemaVersion => 1;
}

LazyDatabase _openConnection() {
  // the LazyDatabase util lets us find the right location for the file async.
  return LazyDatabase(() async {
    // put the database file, called db.sqlite here, into the documents folder
    // for your app.
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));
    return NativeDatabase(file);
  });
}
