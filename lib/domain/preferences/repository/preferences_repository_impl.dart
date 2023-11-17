import 'package:injectable/injectable.dart';
import 'package:movie_list_app/data/preferences/preferences_datasource.dart';
import 'package:movie_list_app/domain/preferences/repository/preferences_repository.dart';

@Singleton(as: PreferencesRepository)
class PreferencesRepositoryImpl extends PreferencesRepository {
  final PreferencesDataSource _preferencesDataSource;

  PreferencesRepositoryImpl(this._preferencesDataSource);
  @override
  Future<String> getLocale() async {
    return _preferencesDataSource.getLocale();
  }

  @override
  Future<void> setLocale(String locale) async {
    await _preferencesDataSource.setLocale(locale);
  }
}
