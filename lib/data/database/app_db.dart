import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:movie_list_app/data/movie/local/dao/movie_dao.dart';
import 'package:movie_list_app/data/movie/local/table/movies.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

part 'app_db.g.dart';

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'movies.sqlite'));

    return NativeDatabase(file);
  });
}

@DriftDatabase(tables: [Movies], daos: [MovieDao])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;
}
