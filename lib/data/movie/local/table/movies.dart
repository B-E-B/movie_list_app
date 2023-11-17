import 'package:drift/drift.dart';

class Movies extends Table {
  IntColumn get filmId => integer()();
  TextColumn get nameRu => text()();
  TextColumn get nameEn => text()();
  TextColumn get year => text()();
  TextColumn get countries => text()();
  TextColumn get genres => text()();
  TextColumn get posterUrl => text()();
  TextColumn get posterUrlPreview => text()();
  TextColumn get description => text()();

  @override
  Set<Column> get primaryKey => {filmId};
}
