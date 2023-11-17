import 'package:injectable/injectable.dart';
import 'package:movie_list_app/data/preferences/preferences_datasource.dart';
import 'package:shared_preferences/shared_preferences.dart';

@Singleton(as: PreferencesDataSource)
class PreferencesDataSourceImpl extends PreferencesDataSource {
  static const String _locale = 'locale';
  final SharedPreferences _sharedPreferences;

  PreferencesDataSourceImpl(this._sharedPreferences);

  @override
  String getLocale() {
    return _sharedPreferences.getString(_locale) ?? 'en';
  }

  @override
  Future<void> setLocale(String locale) async {
    await _sharedPreferences.setString(_locale, locale);
  }
}
